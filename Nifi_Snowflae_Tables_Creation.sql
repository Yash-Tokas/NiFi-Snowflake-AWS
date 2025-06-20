create database if not exists scd_demo;
use database scd_demo;
create schema if not exists scd2;
use schema scd2;
show tables;

// The customer table keeps track of every update that has been made to the actual customer table (customer_raw)
create or replace table customer (
     customer_id number,
     first_name varchar,
     last_name varchar,
     email varchar,
     street varchar,
     city varchar,
     state varchar,
     country varchar,
     update_timestamp timestamp_ntz default current_timestamp());

// This is our SCD2 table, where we save the history. 
create or replace table customer_history (
     customer_id number,
     first_name varchar,
     last_name varchar,
     email varchar,
     street varchar,
     city varchar,
     state varchar,
     country varchar,
     start_time timestamp_ntz default current_timestamp(),
     end_time timestamp_ntz default current_timestamp(),
     is_current boolean
     );

// This is our raw table, whenever we have data coming to our S3 bucket, it will be first loaded to this table.In other words, this is our staging table.
create or replace table customer_raw (
     customer_id number,
     first_name varchar,
     last_name varchar,
     email varchar,
     street varchar,
     city varchar,
     state varchar,
     country varchar);

// We will update our other 2 tables with the help of Snowflake Stream & Task. Stream will keep track of all the changes being made.
create or replace stream customer_table_changes on table customer;
