-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xGjVJn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaign" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(200)   NOT NULL,
    "description" VARCHAR(200)   NOT NULL,
    "goal" INTEGER   NOT NULL,
    "pledged" INTEGER   NOT NULL,
    "outcome" VARCHAR(50)   NOT NULL,
    "backers_count" INTEGER(20)   NOT NULL,
    "country" VARCHAR(10)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCAHR(10)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL
);

CREATE TABLE "category" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "sub_category" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_sub_category" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "email" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "category" ADD CONSTRAINT "fk_category_category_id" FOREIGN KEY("category_id")
REFERENCES "campaign" ("category_id");

ALTER TABLE "sub_category" ADD CONSTRAINT "fk_sub_category_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "campaign" ("subcategory_id");

