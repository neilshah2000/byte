--  PostgreSQL 12.2 (Ubuntu 12.2-4) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.3.0-8ubuntu1) 9.3.0, 64-bit

create table app_events (
      bot_id text not null,
      event_id bigserial not null,
      aggregate_type text not null,
      aggregate_id text not null,
      event_type text not null,
      event_data jsonb not null,
      created_at timestamp default now() not null,
      primary key (event_id)
);

INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-allergy-info", "field2": ""}', '2016-06-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-05-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-pay", "field2": ""}', '2016-07-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-09-22 19:10:25-07');

INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-allergy-info", "field2": ""}', '2016-06-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-05-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-pay", "field2": ""}', '2016-07-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-09-22 19:10:25-07');


INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-06-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-pay", "field2": ""}', '2016-05-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-07-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b1', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-allergy-info", "field2": ""}', '2016-09-22 19:10:25-07');

INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder", "field2": ""}', '2016-06-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-allergy-info", "field2": ""}', '2016-05-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-pay", "field2": ""}', '2016-07-22 19:10:25-07');
INSERT INTO app_events (bot_id, aggregate_type, aggregate_id, event_type, event_data, created_at) VALUES ('b2', 'agg2', 'aggid1', 'VisitState', '{"StateName": "reorder-allergy-info", "field2": ""}', '2016-09-22 19:10:25-07');


PREPARE countStateInMonth(text,int,text) AS
    SELECT  *
    FROM app_events
    WHERE bot_id = $1
        AND EXTRACT(MONTH FROM created_at) = $2
        AND event_data ->> 'StateName' = $3;

EXECUTE countStateInMonth('b2','7', 'reorder-pay');

DEALLOCATE countStateInMonth;


