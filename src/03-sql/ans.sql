--  PostgreSQL 12.2 (Ubuntu 12.2-4) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.3.0-8ubuntu1) 9.3.0, 64-bit

CREATE TABLE lastAdReferral (
    id SERIAL PRIMARY KEY,
    source text,
    type text,
    adId text
);

CREATE TABLE profile (
    psid text PRIMARY KEY,
    first_name text,
    lastName text,
    profilePic text,
    locale text,
    timezone integer,
    gender text,
    lastAdReferral integer REFERENCES lastAdReferral,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

INSERT INTO lastAdReferral (source, type, adId) VALUES ('ADS', 'OPEN_THREAD', '6045246247433');

INSERT INTO profile (psid, first_name, lastName, profilePic, locale, timezone, gender, lastAdReferral) VALUES ('id123', 'Peter', 'Chang', 'https://example.com/13055603_10105219398495383_8237637584159975445_n.jpg', 'en_US', -7, 'male', 1);

SELECT *
FROM profile join lastAdReferral lAR on lAR.id = profile.lastAdReferral;


CREATE OR REPLACE FUNCTION amend_updated_timestamp()
  RETURNS trigger AS
$BODY$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER amend_updated_timestamp
    BEFORE UPDATE
    ON profile
    FOR EACH ROW
    EXECUTE PROCEDURE amend_updated_timestamp();

UPDATE profile
    SET lastName = 'lastNew'
WHERE psid = 'id123';
