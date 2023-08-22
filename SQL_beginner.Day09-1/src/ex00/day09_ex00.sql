CREATE TABLE person_audit
(
    created    timestamptz(0) NOT NULL DEFAULT (CURRENT_TIMESTAMP),
        type_event char(1)
            CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
        row_id     bigint         NOT NULL,
        name       varchar,
        age        integer,
        gender     varchar,
        address    varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$trg_person_insert_audit$
BEGIN
	-- TG_OP - тип операции
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO person_audit SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.*;
	END IF;
	-- return values for after triggers are ignores
	RETURN NULL;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
	AFTER INSERT
	ON person
	FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
