## code

answers are in the /src/* folder

used node v14.4.0

## general

```npm install```

run tests on checksum and spreadsheet checksum   
```npm run test``


## SQL

04-sql - performance can be improved by adding a multi column index on (bot_id, created_at and event_data ->> 'StateName') columns so where clause doesn't have to do a full table scan
