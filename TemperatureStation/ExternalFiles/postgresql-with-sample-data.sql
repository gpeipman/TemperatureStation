--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-01-24 03:30:28 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2241 (class 0 OID 16394)
-- Dependencies: 181
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16394)
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "RoleId" text NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 16400)
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetRoles" (
    "Id" text NOT NULL,
    "ConcurrencyStamp" text,
    "Name" character varying(256),
    "NormalizedName" character varying(256)
);


--
-- TOC entry 183 (class 1259 OID 16406)
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetUserClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "UserId" text NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 16412)
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetUserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 16418)
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 16424)
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


--
-- TOC entry 187 (class 1259 OID 16430)
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AspNetUsers" (
    "Id" text NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "ConcurrencyStamp" text,
    "Email" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "LockoutEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "NormalizedEmail" character varying(256),
    "NormalizedUserName" character varying(256),
    "PasswordHash" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "SecurityStamp" text,
    "TwoFactorEnabled" boolean NOT NULL,
    "UserName" character varying(256)
);

--
-- TOC entry 189 (class 1259 OID 24591)
-- Name: measurements_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calculators_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 189 (class 1259 OID 24591)
-- Name: measurements_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE measurements_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 192 (class 1259 OID 24609)
-- Name: Calculators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Calculators" (
    "Id" integer DEFAULT nextval('calculators_seq'::regclass) NOT NULL,
    "MeasurementId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Parameters" character varying(512)
);


--
-- TOC entry 190 (class 1259 OID 24600)
-- Name: Measurements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Measurements" (
    "Id" integer DEFAULT nextval('measurements_seq'::regclass) NOT NULL,
    "Name" character varying(50) NOT NULL,
    "IsActive" boolean DEFAULT false NOT NULL,
    "FreezingPoint" double precision,
    "CoolingRate" double precision,
    "OriginalGravity" double precision,
    "FinalGravity" double precision,
    "AlcoholByVolume" double precision,
    "AlcoholByWeight" double precision
);


--
-- TOC entry 195 (class 1259 OID 24644)
-- Name: readings_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE readings_seq
    START WITH 2113
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 196 (class 1259 OID 24646)
-- Name: Readings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Readings" (
    "Id" integer DEFAULT nextval('readings_seq'::regclass) NOT NULL,
    "ReadingType" character varying(50) NOT NULL,
    "ReadingTime" date NOT NULL,
    "Value" double precision NOT NULL,
    "MeasurementId" integer NOT NULL,
    "SensorRoleId" integer,
    "CalculatorId" integer
);


--
-- TOC entry 193 (class 1259 OID 24623)
-- Name: sensorroles_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sensorroles_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 194 (class 1259 OID 24625)
-- Name: SensorRoles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SensorRoles" (
    "Id" integer DEFAULT nextval('sensorroles_seq'::regclass) NOT NULL,
    "MeasurementId" integer NOT NULL,
    "SensorId" character varying(450) NOT NULL,
    "RoleName" character varying(50) NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 24586)
-- Name: Sensors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Sensors" (
    "Id" character varying(450) NOT NULL,
    "Name" character varying(50)
);


--
-- TOC entry 191 (class 1259 OID 24607)
-- Name: calculators_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calculators_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2087 (class 2606 OID 16453)
-- Name: PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2089 (class 2606 OID 16455)
-- Name: PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- TOC entry 2093 (class 2606 OID 16457)
-- Name: PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2096 (class 2606 OID 16459)
-- Name: PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- TOC entry 2100 (class 2606 OID 16461)
-- Name: PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 2102 (class 2606 OID 16463)
-- Name: PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- TOC entry 2105 (class 2606 OID 16465)
-- Name: PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- TOC entry 2112 (class 2606 OID 24617)
-- Name: PK_Calculators; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Calculators"
    ADD CONSTRAINT "PK_Calculators" PRIMARY KEY ("Id");


--
-- TOC entry 2110 (class 2606 OID 24606)
-- Name: PK_Measurements; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Measurements"
    ADD CONSTRAINT "PK_Measurements" PRIMARY KEY ("Id");


--
-- TOC entry 2116 (class 2606 OID 24651)
-- Name: PK_Readings; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Readings"
    ADD CONSTRAINT "PK_Readings" PRIMARY KEY ("Id");


--
-- TOC entry 2114 (class 2606 OID 24633)
-- Name: PK_SensorRoles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SensorRoles"
    ADD CONSTRAINT "PK_SensorRoles" PRIMARY KEY ("Id");


--
-- TOC entry 2108 (class 2606 OID 24590)
-- Name: PK_Sensors; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Sensors"
    ADD CONSTRAINT "PK_Sensors" PRIMARY KEY ("Id");


--
-- TOC entry 2103 (class 1259 OID 16468)
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EmailIndex" ON "AspNetUsers" USING btree ("NormalizedEmail");


--
-- TOC entry 2085 (class 1259 OID 16469)
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" USING btree ("RoleId");


--
-- TOC entry 2091 (class 1259 OID 16470)
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" USING btree ("UserId");


--
-- TOC entry 2094 (class 1259 OID 16471)
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" USING btree ("UserId");


--
-- TOC entry 2097 (class 1259 OID 16472)
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" USING btree ("RoleId");


--
-- TOC entry 2098 (class 1259 OID 16473)
-- Name: IX_AspNetUserRoles_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserRoles_UserId" ON "AspNetUserRoles" USING btree ("UserId");


--
-- TOC entry 2090 (class 1259 OID 16475)
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "RoleNameIndex" ON "AspNetRoles" USING btree ("NormalizedName");


--
-- TOC entry 2106 (class 1259 OID 16476)
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" USING btree ("NormalizedUserName");


--
-- TOC entry 2117 (class 2606 OID 16477)
-- Name: FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2118 (class 2606 OID 16482)
-- Name: FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2119 (class 2606 OID 16487)
-- Name: FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2120 (class 2606 OID 16492)
-- Name: FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2121 (class 2606 OID 16497)
-- Name: FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2122 (class 2606 OID 24618)
-- Name: FK_Calculators_Measurements; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Calculators"
    ADD CONSTRAINT "FK_Calculators_Measurements" FOREIGN KEY ("MeasurementId") REFERENCES "Measurements"("Id");


--
-- TOC entry 2126 (class 2606 OID 24657)
-- Name: FK_Readings_Calculators; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Readings"
    ADD CONSTRAINT "FK_Readings_Calculators" FOREIGN KEY ("CalculatorId") REFERENCES "Calculators"("Id");


--
-- TOC entry 2125 (class 2606 OID 24652)
-- Name: FK_Readings_SensorRoles; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Readings"
    ADD CONSTRAINT "FK_Readings_SensorRoles" FOREIGN KEY ("SensorRoleId") REFERENCES "SensorRoles"("Id");


--
-- TOC entry 2123 (class 2606 OID 24634)
-- Name: FK_SensorRoles_Measurements; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SensorRoles"
    ADD CONSTRAINT "FK_SensorRoles_Measurements" FOREIGN KEY ("MeasurementId") REFERENCES "Measurements"("Id");


--
-- TOC entry 2124 (class 2606 OID 24639)
-- Name: FK_SensorRoles_Sensors; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SensorRoles"
    ADD CONSTRAINT "FK_SensorRoles_Sensors" FOREIGN KEY ("SensorId") REFERENCES "Sensors"("Id");


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2242 (class 0 OID 16400)
-- Dependencies: 182
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "AspNetRoles" VALUES ('Administrator', NULL, 'Administrator', 'Administrator');
INSERT INTO "AspNetRoles" VALUES ('PowerUser', NULL, 'PowerUser', 'PowerUser');

--
-- TOC entry 2247 (class 0 OID 16430)
-- Dependencies: 187
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "AspNetUsers" VALUES ('3e89946e-728f-4537-beb7-e0b6e4b2c607', 0, '6107b0bb-e0a8-44ea-b1ec-272860a9dd96', 'gpeipman@hotmail.com', false, true, NULL, 'GPEIPMAN@HOTMAIL.COM', 'GPEIPMAN@HOTMAIL.COM', 'AQAAAAEAACcQAAAAELMJHsH1hupRtYD65/QO3IdxYrn86MzdbnSEGjcoe//pvt+3fIhp0Y6Z8ysVgBWSLg==', NULL, false, '346fdf3b-0cab-4191-90d0-0cadb969fec6', false, 'gpeipman@hotmail.com');


--
-- TOC entry 2252 (class 0 OID 24609)
-- Dependencies: 192
-- Data for Name: Calculators; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Calculators" VALUES (1, 1, 'Alcohol volume calculator', NULL);
INSERT INTO "Calculators" VALUES (2, 1, 'Freezing estimate calculator', 'Ambient;Beer');
INSERT INTO "Calculators" VALUES (3, 1, 'Heat Exchange Rate', 'Ambient;Beer');


--
-- TOC entry 2250 (class 0 OID 24600)
-- Dependencies: 190
-- Data for Name: Measurements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Measurements" VALUES (1, 'Christmas ale #9 freezing', false, -1, 0.00176982232369482994, 1.07800000000000007, 1.02400000000000002, 7, 5.5);
INSERT INTO "Measurements" VALUES (2, 'Weizenbock #3 mashing', false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Measurements" VALUES (3, 'Baltic Porter #3 mashing', false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Measurements" VALUES (4, 'Test #1', false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Measurements" VALUES (5, 'Test #2', false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Measurements" VALUES (6, 'Test #3', false, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2256 (class 0 OID 24646)
-- Dependencies: 196
-- Data for Name: Readings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Readings" VALUES (67, 'SE', '2017-01-05', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (68, 'SE', '2017-01-05', 19.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (69, 'CA', '2017-01-05', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (70, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (71, 'SE', '2017-01-05', 19.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (72, 'CA', '2017-01-05', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (73, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (74, 'SE', '2017-01-05', 19.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (75, 'CA', '2017-01-05', 715, 1, NULL, 2);
INSERT INTO "Readings" VALUES (76, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (77, 'SE', '2017-01-05', 19.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (78, 'CA', '2017-01-05', 710, 1, NULL, 2);
INSERT INTO "Readings" VALUES (79, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (80, 'SE', '2017-01-05', 18.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (81, 'CA', '2017-01-05', 705, 1, NULL, 2);
INSERT INTO "Readings" VALUES (82, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (83, 'SE', '2017-01-05', 18.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (84, 'CA', '2017-01-05', 698, 1, NULL, 2);
INSERT INTO "Readings" VALUES (85, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (86, 'SE', '2017-01-05', 18.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (87, 'CA', '2017-01-05', 692, 1, NULL, 2);
INSERT INTO "Readings" VALUES (88, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (89, 'SE', '2017-01-05', 17.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (90, 'CA', '2017-01-05', 685, 1, NULL, 2);
INSERT INTO "Readings" VALUES (91, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (92, 'SE', '2017-01-05', 17.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (93, 'CA', '2017-01-05', 680, 1, NULL, 2);
INSERT INTO "Readings" VALUES (94, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (95, 'SE', '2017-01-05', 17.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (96, 'CA', '2017-01-05', 650, 1, NULL, 2);
INSERT INTO "Readings" VALUES (97, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (98, 'SE', '2017-01-05', 17.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (99, 'CA', '2017-01-05', 668, 1, NULL, 2);
INSERT INTO "Readings" VALUES (100, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (101, 'SE', '2017-01-05', 16.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (102, 'CA', '2017-01-05', 662, 1, NULL, 2);
INSERT INTO "Readings" VALUES (103, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (104, 'SE', '2017-01-05', 16.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (105, 'CA', '2017-01-05', 634, 1, NULL, 2);
INSERT INTO "Readings" VALUES (106, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (107, 'SE', '2017-01-05', 16.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (108, 'CA', '2017-01-05', 650, 1, NULL, 2);
INSERT INTO "Readings" VALUES (109, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (110, 'SE', '2017-01-05', 16, 1, 2, NULL);
INSERT INTO "Readings" VALUES (111, 'CA', '2017-01-05', 621, 1, NULL, 2);
INSERT INTO "Readings" VALUES (112, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (113, 'SE', '2017-01-05', 15.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (114, 'CA', '2017-01-05', 639, 1, NULL, 2);
INSERT INTO "Readings" VALUES (115, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (116, 'SE', '2017-01-05', 15.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (117, 'CA', '2017-01-05', 633, 1, NULL, 2);
INSERT INTO "Readings" VALUES (118, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (119, 'SE', '2017-01-05', 15.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (120, 'CA', '2017-01-05', 627, 1, NULL, 2);
INSERT INTO "Readings" VALUES (121, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (122, 'SE', '2017-01-05', 15, 1, 2, NULL);
INSERT INTO "Readings" VALUES (123, 'CA', '2017-01-05', 599, 1, NULL, 2);
INSERT INTO "Readings" VALUES (124, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (125, 'SE', '2017-01-05', 14.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (126, 'CA', '2017-01-05', 615, 1, NULL, 2);
INSERT INTO "Readings" VALUES (127, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (128, 'SE', '2017-01-05', 14.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (129, 'CA', '2017-01-05', 611, 1, NULL, 2);
INSERT INTO "Readings" VALUES (130, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (131, 'SE', '2017-01-05', 14.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (132, 'CA', '2017-01-05', 605, 1, NULL, 2);
INSERT INTO "Readings" VALUES (133, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (134, 'SE', '2017-01-05', 14.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (135, 'CA', '2017-01-05', 577, 1, NULL, 2);
INSERT INTO "Readings" VALUES (136, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (137, 'SE', '2017-01-05', 13.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (138, 'CA', '2017-01-05', 571, 1, NULL, 2);
INSERT INTO "Readings" VALUES (139, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (140, 'SE', '2017-01-05', 13.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (141, 'CA', '2017-01-05', 564, 1, NULL, 2);
INSERT INTO "Readings" VALUES (142, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (143, 'SE', '2017-01-05', 13.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (144, 'CA', '2017-01-05', 582, 1, NULL, 2);
INSERT INTO "Readings" VALUES (145, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (146, 'SE', '2017-01-05', 13.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (147, 'CA', '2017-01-05', 575, 1, NULL, 2);
INSERT INTO "Readings" VALUES (148, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (149, 'SE', '2017-01-05', 12.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (150, 'CA', '2017-01-05', 569, 1, NULL, 2);
INSERT INTO "Readings" VALUES (151, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (152, 'SE', '2017-01-05', 12.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (153, 'CA', '2017-01-05', 564, 1, NULL, 2);
INSERT INTO "Readings" VALUES (154, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (155, 'SE', '2017-01-05', 12.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (156, 'CA', '2017-01-05', 559, 1, NULL, 2);
INSERT INTO "Readings" VALUES (157, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (158, 'SE', '2017-01-05', 12.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (159, 'CA', '2017-01-05', 552, 1, NULL, 2);
INSERT INTO "Readings" VALUES (160, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (161, 'SE', '2017-01-05', 12.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (162, 'CA', '2017-01-05', 547, 1, NULL, 2);
INSERT INTO "Readings" VALUES (163, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (164, 'SE', '2017-01-05', 11.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (165, 'CA', '2017-01-05', 541, 1, NULL, 2);
INSERT INTO "Readings" VALUES (166, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (167, 'SE', '2017-01-05', 11.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (168, 'CA', '2017-01-05', 536, 1, NULL, 2);
INSERT INTO "Readings" VALUES (169, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (170, 'SE', '2017-01-05', 11.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (171, 'CA', '2017-01-05', 510, 1, NULL, 2);
INSERT INTO "Readings" VALUES (172, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (173, 'SE', '2017-01-05', 11.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (174, 'CA', '2017-01-05', 525, 1, NULL, 2);
INSERT INTO "Readings" VALUES (175, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (176, 'SE', '2017-01-05', 11.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (177, 'CA', '2017-01-05', 520, 1, NULL, 2);
INSERT INTO "Readings" VALUES (178, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (179, 'SE', '2017-01-05', 10.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (180, 'CA', '2017-01-05', 515, 1, NULL, 2);
INSERT INTO "Readings" VALUES (181, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (182, 'SE', '2017-01-05', 10.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (183, 'CA', '2017-01-05', 509, 1, NULL, 2);
INSERT INTO "Readings" VALUES (184, 'SE', '2017-01-05', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (185, 'SE', '2017-01-05', 10.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (186, 'CA', '2017-01-05', 526, 1, NULL, 2);
INSERT INTO "Readings" VALUES (187, 'SE', '2017-01-05', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (188, 'SE', '2017-01-05', 10.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (189, 'CA', '2017-01-05', 520, 1, NULL, 2);
INSERT INTO "Readings" VALUES (190, 'SE', '2017-01-05', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (191, 'SE', '2017-01-05', 10.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (192, 'CA', '2017-01-05', 514, 1, NULL, 2);
INSERT INTO "Readings" VALUES (193, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (194, 'SE', '2017-01-05', 9.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (195, 'CA', '2017-01-05', 487, 1, NULL, 2);
INSERT INTO "Readings" VALUES (196, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (197, 'SE', '2017-01-05', 9.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (198, 'CA', '2017-01-05', 482, 1, NULL, 2);
INSERT INTO "Readings" VALUES (199, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (200, 'SE', '2017-01-05', 9.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (201, 'CA', '2017-01-05', 478, 1, NULL, 2);
INSERT INTO "Readings" VALUES (202, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (203, 'SE', '2017-01-05', 9.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (204, 'CA', '2017-01-05', 472, 1, NULL, 2);
INSERT INTO "Readings" VALUES (205, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (206, 'SE', '2017-01-05', 9.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (207, 'CA', '2017-01-05', 466, 1, NULL, 2);
INSERT INTO "Readings" VALUES (208, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (209, 'SE', '2017-01-05', 9.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (210, 'CA', '2017-01-05', 461, 1, NULL, 2);
INSERT INTO "Readings" VALUES (211, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (212, 'SE', '2017-01-05', 8.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (213, 'CA', '2017-01-05', 457, 1, NULL, 2);
INSERT INTO "Readings" VALUES (214, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (215, 'SE', '2017-01-05', 8.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (216, 'CA', '2017-01-05', 432, 1, NULL, 2);
INSERT INTO "Readings" VALUES (217, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (218, 'SE', '2017-01-05', 8.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (219, 'CA', '2017-01-05', 445, 1, NULL, 2);
INSERT INTO "Readings" VALUES (220, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (221, 'SE', '2017-01-05', 8.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (222, 'CA', '2017-01-05', 441, 1, NULL, 2);
INSERT INTO "Readings" VALUES (223, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (224, 'SE', '2017-01-05', 8.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (225, 'CA', '2017-01-05', 435, 1, NULL, 2);
INSERT INTO "Readings" VALUES (226, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (227, 'SE', '2017-01-05', 8.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (228, 'CA', '2017-01-05', 431, 1, NULL, 2);
INSERT INTO "Readings" VALUES (229, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (230, 'SE', '2017-01-05', 7.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (231, 'CA', '2017-01-05', 424, 1, NULL, 2);
INSERT INTO "Readings" VALUES (232, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (233, 'SE', '2017-01-05', 7.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (234, 'CA', '2017-01-05', 420, 1, NULL, 2);
INSERT INTO "Readings" VALUES (235, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (236, 'SE', '2017-01-05', 7.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (237, 'CA', '2017-01-05', 396, 1, NULL, 2);
INSERT INTO "Readings" VALUES (238, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (239, 'SE', '2017-01-05', 7.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (240, 'CA', '2017-01-05', 410, 1, NULL, 2);
INSERT INTO "Readings" VALUES (241, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (242, 'SE', '2017-01-05', 7.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (243, 'CA', '2017-01-05', 388, 1, NULL, 2);
INSERT INTO "Readings" VALUES (244, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (245, 'SE', '2017-01-05', 7.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (246, 'CA', '2017-01-05', 399, 1, NULL, 2);
INSERT INTO "Readings" VALUES (247, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (248, 'SE', '2017-01-05', 7.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (249, 'CA', '2017-01-05', 377, 1, NULL, 2);
INSERT INTO "Readings" VALUES (250, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (251, 'SE', '2017-01-05', 6.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (252, 'CA', '2017-01-05', 373, 1, NULL, 2);
INSERT INTO "Readings" VALUES (253, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (254, 'SE', '2017-01-05', 6.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (255, 'CA', '2017-01-05', 383, 1, NULL, 2);
INSERT INTO "Readings" VALUES (256, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (257, 'SE', '2017-01-05', 6.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (258, 'CA', '2017-01-05', 362, 1, NULL, 2);
INSERT INTO "Readings" VALUES (259, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (260, 'SE', '2017-01-05', 6.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (261, 'CA', '2017-01-05', 358, 1, NULL, 2);
INSERT INTO "Readings" VALUES (262, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (263, 'SE', '2017-01-05', 6.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (264, 'CA', '2017-01-05', 351, 1, NULL, 2);
INSERT INTO "Readings" VALUES (265, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (266, 'SE', '2017-01-05', 6.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (267, 'CA', '2017-01-05', 347, 1, NULL, 2);
INSERT INTO "Readings" VALUES (268, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (269, 'SE', '2017-01-05', 6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (270, 'CA', '2017-01-05', 342, 1, NULL, 2);
INSERT INTO "Readings" VALUES (271, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (272, 'SE', '2017-01-05', 5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (273, 'CA', '2017-01-05', 338, 1, NULL, 2);
INSERT INTO "Readings" VALUES (274, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (275, 'SE', '2017-01-05', 5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (276, 'CA', '2017-01-05', 331, 1, NULL, 2);
INSERT INTO "Readings" VALUES (277, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (278, 'SE', '2017-01-05', 5.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (279, 'CA', '2017-01-05', 326, 1, NULL, 2);
INSERT INTO "Readings" VALUES (280, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (281, 'SE', '2017-01-05', 5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (282, 'CA', '2017-01-05', 321, 1, NULL, 2);
INSERT INTO "Readings" VALUES (283, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (284, 'SE', '2017-01-05', 5.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (285, 'CA', '2017-01-05', 317, 1, NULL, 2);
INSERT INTO "Readings" VALUES (286, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (287, 'SE', '2017-01-05', 5.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (288, 'CA', '2017-01-05', 312, 1, NULL, 2);
INSERT INTO "Readings" VALUES (289, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (290, 'SE', '2017-01-05', 5.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (291, 'CA', '2017-01-05', 307, 1, NULL, 2);
INSERT INTO "Readings" VALUES (292, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (293, 'SE', '2017-01-05', 5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (294, 'CA', '2017-01-05', 302, 1, NULL, 2);
INSERT INTO "Readings" VALUES (295, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (296, 'SE', '2017-01-05', 4.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (297, 'CA', '2017-01-05', 297, 1, NULL, 2);
INSERT INTO "Readings" VALUES (298, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (299, 'SE', '2017-01-05', 4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (300, 'CA', '2017-01-05', 307, 1, NULL, 2);
INSERT INTO "Readings" VALUES (301, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (302, 'SE', '2017-01-05', 4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (303, 'CA', '2017-01-05', 290, 1, NULL, 2);
INSERT INTO "Readings" VALUES (304, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (305, 'SE', '2017-01-05', 4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (306, 'CA', '2017-01-05', 285, 1, NULL, 2);
INSERT INTO "Readings" VALUES (307, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (308, 'SE', '2017-01-05', 4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (309, 'CA', '2017-01-05', 280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (310, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (311, 'SE', '2017-01-05', 4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (312, 'CA', '2017-01-05', 275, 1, NULL, 2);
INSERT INTO "Readings" VALUES (313, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (314, 'SE', '2017-01-05', 4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (315, 'CA', '2017-01-05', 270, 1, NULL, 2);
INSERT INTO "Readings" VALUES (316, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (317, 'SE', '2017-01-05', 4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (318, 'CA', '2017-01-05', 267, 1, NULL, 2);
INSERT INTO "Readings" VALUES (319, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (320, 'SE', '2017-01-05', 4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (321, 'CA', '2017-01-05', 262, 1, NULL, 2);
INSERT INTO "Readings" VALUES (322, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (323, 'SE', '2017-01-05', 3.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (324, 'CA', '2017-01-05', 257, 1, NULL, 2);
INSERT INTO "Readings" VALUES (325, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (326, 'SE', '2017-01-05', 3.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (327, 'CA', '2017-01-05', 254, 1, NULL, 2);
INSERT INTO "Readings" VALUES (328, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (329, 'SE', '2017-01-05', 3.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (330, 'CA', '2017-01-05', 249, 1, NULL, 2);
INSERT INTO "Readings" VALUES (331, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (332, 'SE', '2017-01-05', 3.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (333, 'CA', '2017-01-05', 243, 1, NULL, 2);
INSERT INTO "Readings" VALUES (334, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (335, 'SE', '2017-01-05', 3.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (336, 'CA', '2017-01-05', 238, 1, NULL, 2);
INSERT INTO "Readings" VALUES (337, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (338, 'SE', '2017-01-05', 3.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (339, 'CA', '2017-01-05', 235, 1, NULL, 2);
INSERT INTO "Readings" VALUES (340, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (341, 'SE', '2017-01-05', 3.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (342, 'CA', '2017-01-05', 230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (343, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (344, 'SE', '2017-01-05', 3.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (345, 'CA', '2017-01-05', 224, 1, NULL, 2);
INSERT INTO "Readings" VALUES (346, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (347, 'SE', '2017-01-05', 3.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (348, 'CA', '2017-01-05', 221, 1, NULL, 2);
INSERT INTO "Readings" VALUES (349, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (350, 'SE', '2017-01-05', 2.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (351, 'CA', '2017-01-05', 216, 1, NULL, 2);
INSERT INTO "Readings" VALUES (352, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (353, 'SE', '2017-01-05', 2.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (354, 'CA', '2017-01-05', 210, 1, NULL, 2);
INSERT INTO "Readings" VALUES (355, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (356, 'SE', '2017-01-05', 2.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (357, 'CA', '2017-01-05', 207, 1, NULL, 2);
INSERT INTO "Readings" VALUES (358, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (359, 'SE', '2017-01-05', 2.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (360, 'CA', '2017-01-05', 204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (361, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (362, 'SE', '2017-01-05', 2.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (363, 'CA', '2017-01-05', 209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (364, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (365, 'SE', '2017-01-05', 2.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (366, 'CA', '2017-01-05', 195, 1, NULL, 2);
INSERT INTO "Readings" VALUES (367, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (368, 'SE', '2017-01-05', 2.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (369, 'CA', '2017-01-05', 199, 1, NULL, 2);
INSERT INTO "Readings" VALUES (370, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (371, 'SE', '2017-01-05', 2.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (372, 'CA', '2017-01-05', 186, 1, NULL, 2);
INSERT INTO "Readings" VALUES (373, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (374, 'SE', '2017-01-05', 2.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (375, 'CA', '2017-01-05', 180, 1, NULL, 2);
INSERT INTO "Readings" VALUES (376, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (377, 'SE', '2017-01-05', 2.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (378, 'CA', '2017-01-05', 177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (379, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (380, 'SE', '2017-01-05', 2.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (381, 'CA', '2017-01-05', 184, 1, NULL, 2);
INSERT INTO "Readings" VALUES (382, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (383, 'SE', '2017-01-05', 2, 1, 2, NULL);
INSERT INTO "Readings" VALUES (384, 'CA', '2017-01-05', 171, 1, NULL, 2);
INSERT INTO "Readings" VALUES (385, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (386, 'SE', '2017-01-05', 1.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (387, 'CA', '2017-01-05', 165, 1, NULL, 2);
INSERT INTO "Readings" VALUES (388, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (389, 'SE', '2017-01-05', 1.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (390, 'CA', '2017-01-05', 171, 1, NULL, 2);
INSERT INTO "Readings" VALUES (391, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (392, 'SE', '2017-01-05', 1.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (393, 'CA', '2017-01-05', 159, 1, NULL, 2);
INSERT INTO "Readings" VALUES (394, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (395, 'SE', '2017-01-05', 1.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (396, 'CA', '2017-01-05', 153, 1, NULL, 2);
INSERT INTO "Readings" VALUES (397, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (398, 'SE', '2017-01-05', 1.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (399, 'CA', '2017-01-05', 149, 1, NULL, 2);
INSERT INTO "Readings" VALUES (400, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (401, 'SE', '2017-01-05', 1.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (402, 'CA', '2017-01-05', 154, 1, NULL, 2);
INSERT INTO "Readings" VALUES (403, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (404, 'SE', '2017-01-05', 1.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (405, 'CA', '2017-01-05', 147, 1, NULL, 2);
INSERT INTO "Readings" VALUES (406, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (407, 'SE', '2017-01-05', 1.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (408, 'CA', '2017-01-05', 144, 1, NULL, 2);
INSERT INTO "Readings" VALUES (409, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (410, 'SE', '2017-01-05', 1.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (411, 'CA', '2017-01-05', 130, 1, NULL, 2);
INSERT INTO "Readings" VALUES (412, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (413, 'SE', '2017-01-05', 1.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (414, 'CA', '2017-01-05', 134, 1, NULL, 2);
INSERT INTO "Readings" VALUES (415, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (416, 'SE', '2017-01-05', 1.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (417, 'CA', '2017-01-05', 130, 1, NULL, 2);
INSERT INTO "Readings" VALUES (418, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (419, 'SE', '2017-01-05', 1, 1, 2, NULL);
INSERT INTO "Readings" VALUES (420, 'CA', '2017-01-05', 120, 1, NULL, 2);
INSERT INTO "Readings" VALUES (421, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (422, 'SE', '2017-01-05', 0.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (423, 'CA', '2017-01-05', 117, 1, NULL, 2);
INSERT INTO "Readings" VALUES (424, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (425, 'SE', '2017-01-05', 0.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (426, 'CA', '2017-01-05', 110, 1, NULL, 2);
INSERT INTO "Readings" VALUES (427, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (428, 'SE', '2017-01-05', 0.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (429, 'CA', '2017-01-05', 112, 1, NULL, 2);
INSERT INTO "Readings" VALUES (430, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (431, 'SE', '2017-01-05', 0.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (432, 'CA', '2017-01-05', 109, 1, NULL, 2);
INSERT INTO "Readings" VALUES (433, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (434, 'SE', '2017-01-05', 0.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (435, 'CA', '2017-01-05', 109, 1, NULL, 2);
INSERT INTO "Readings" VALUES (436, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (437, 'SE', '2017-01-05', 0.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (438, 'CA', '2017-01-05', 96, 1, NULL, 2);
INSERT INTO "Readings" VALUES (439, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (440, 'SE', '2017-01-05', 0.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (441, 'CA', '2017-01-05', 98, 1, NULL, 2);
INSERT INTO "Readings" VALUES (442, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (443, 'SE', '2017-01-05', 0.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (444, 'CA', '2017-01-05', 94, 1, NULL, 2);
INSERT INTO "Readings" VALUES (445, 'SE', '2017-01-05', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (446, 'SE', '2017-01-05', 0.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (447, 'CA', '2017-01-05', 81, 1, NULL, 2);
INSERT INTO "Readings" VALUES (448, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (449, 'SE', '2017-01-05', 0.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (450, 'CA', '2017-01-05', 82, 1, NULL, 2);
INSERT INTO "Readings" VALUES (451, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (452, 'SE', '2017-01-05', 0.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (453, 'CA', '2017-01-05', 78, 1, NULL, 2);
INSERT INTO "Readings" VALUES (454, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (455, 'SE', '2017-01-05', 0.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (456, 'CA', '2017-01-05', 74, 1, NULL, 2);
INSERT INTO "Readings" VALUES (457, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (458, 'SE', '2017-01-05', 0.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (459, 'CA', '2017-01-05', 71, 1, NULL, 2);
INSERT INTO "Readings" VALUES (460, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (461, 'SE', '2017-01-05', 0.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (462, 'CA', '2017-01-05', 67, 1, NULL, 2);
INSERT INTO "Readings" VALUES (463, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (464, 'SE', '2017-01-05', 0, 1, 2, NULL);
INSERT INTO "Readings" VALUES (465, 'CA', '2017-01-05', 63, 1, NULL, 2);
INSERT INTO "Readings" VALUES (466, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (467, 'SE', '2017-01-05', -0.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (468, 'CA', '2017-01-05', 60, 1, NULL, 2);
INSERT INTO "Readings" VALUES (469, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (470, 'SE', '2017-01-05', -0.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (471, 'CA', '2017-01-05', 59, 1, NULL, 2);
INSERT INTO "Readings" VALUES (472, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (473, 'SE', '2017-01-05', -0.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (474, 'CA', '2017-01-05', 52, 1, NULL, 2);
INSERT INTO "Readings" VALUES (475, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (476, 'SE', '2017-01-05', -0.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (477, 'CA', '2017-01-05', 51, 1, NULL, 2);
INSERT INTO "Readings" VALUES (478, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (479, 'SE', '2017-01-05', -0.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (480, 'CA', '2017-01-05', 44, 1, NULL, 2);
INSERT INTO "Readings" VALUES (481, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (482, 'SE', '2017-01-05', -0.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (483, 'CA', '2017-01-05', 43, 1, NULL, 2);
INSERT INTO "Readings" VALUES (484, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (485, 'SE', '2017-01-05', -0.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (486, 'CA', '2017-01-05', 37, 1, NULL, 2);
INSERT INTO "Readings" VALUES (487, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (488, 'SE', '2017-01-05', -0.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (489, 'CA', '2017-01-05', 33, 1, NULL, 2);
INSERT INTO "Readings" VALUES (490, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (491, 'SE', '2017-01-05', -0.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (492, 'CA', '2017-01-05', 31, 1, NULL, 2);
INSERT INTO "Readings" VALUES (493, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (494, 'SE', '2017-01-05', -0.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (495, 'CA', '2017-01-05', 26, 1, NULL, 2);
INSERT INTO "Readings" VALUES (496, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (497, 'SE', '2017-01-05', -0.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (498, 'CA', '2017-01-05', 22, 1, NULL, 2);
INSERT INTO "Readings" VALUES (499, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (500, 'SE', '2017-01-05', -0.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (501, 'CA', '2017-01-05', 17, 1, NULL, 2);
INSERT INTO "Readings" VALUES (502, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (503, 'SE', '2017-01-05', -0.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (504, 'CA', '2017-01-05', 13, 1, NULL, 2);
INSERT INTO "Readings" VALUES (505, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (506, 'SE', '2017-01-05', -0.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (507, 'CA', '2017-01-05', 13, 1, NULL, 2);
INSERT INTO "Readings" VALUES (508, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (509, 'SE', '2017-01-05', -0.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (510, 'CA', '2017-01-05', 9, 1, NULL, 2);
INSERT INTO "Readings" VALUES (511, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (512, 'SE', '2017-01-05', -0.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (513, 'CA', '2017-01-05', 5, 1, NULL, 2);
INSERT INTO "Readings" VALUES (514, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (515, 'SE', '2017-01-05', -1, 1, 2, NULL);
INSERT INTO "Readings" VALUES (516, 'CA', '2017-01-05', 0, 1, NULL, 2);
INSERT INTO "Readings" VALUES (517, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (518, 'SE', '2017-01-05', -1.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (519, 'CA', '2017-01-05', -8, 1, NULL, 2);
INSERT INTO "Readings" VALUES (520, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (521, 'SE', '2017-01-05', -1.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (522, 'CA', '2017-01-05', -12, 1, NULL, 2);
INSERT INTO "Readings" VALUES (523, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (524, 'SE', '2017-01-05', -1.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (525, 'CA', '2017-01-05', -16, 1, NULL, 2);
INSERT INTO "Readings" VALUES (526, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (527, 'SE', '2017-01-05', -1.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (528, 'CA', '2017-01-05', -21, 1, NULL, 2);
INSERT INTO "Readings" VALUES (529, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (530, 'SE', '2017-01-05', -1.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (531, 'CA', '2017-01-05', -27, 1, NULL, 2);
INSERT INTO "Readings" VALUES (532, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (533, 'SE', '2017-01-05', -1.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (534, 'CA', '2017-01-05', -27, 1, NULL, 2);
INSERT INTO "Readings" VALUES (535, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (536, 'SE', '2017-01-05', -1.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (537, 'CA', '2017-01-05', -25, 1, NULL, 2);
INSERT INTO "Readings" VALUES (538, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (539, 'SE', '2017-01-05', -1.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (540, 'CA', '2017-01-05', -31, 1, NULL, 2);
INSERT INTO "Readings" VALUES (541, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (542, 'SE', '2017-01-05', -1.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (543, 'CA', '2017-01-05', -29, 1, NULL, 2);
INSERT INTO "Readings" VALUES (544, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (545, 'SE', '2017-01-05', -1.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (546, 'CA', '2017-01-05', -29, 1, NULL, 2);
INSERT INTO "Readings" VALUES (547, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (548, 'SE', '2017-01-05', -1.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (549, 'CA', '2017-01-05', -34, 1, NULL, 2);
INSERT INTO "Readings" VALUES (550, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (551, 'SE', '2017-01-05', -1.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (552, 'CA', '2017-01-05', -34, 1, NULL, 2);
INSERT INTO "Readings" VALUES (553, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (554, 'SE', '2017-01-05', -1.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (555, 'CA', '2017-01-05', -50, 1, NULL, 2);
INSERT INTO "Readings" VALUES (556, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (557, 'SE', '2017-01-05', -1.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (558, 'CA', '2017-01-05', -55, 1, NULL, 2);
INSERT INTO "Readings" VALUES (559, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (560, 'SE', '2017-01-05', -1.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (561, 'CA', '2017-01-05', -55, 1, NULL, 2);
INSERT INTO "Readings" VALUES (562, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (563, 'SE', '2017-01-05', -1.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (564, 'CA', '2017-01-05', -56, 1, NULL, 2);
INSERT INTO "Readings" VALUES (565, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (566, 'SE', '2017-01-05', -1.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (567, 'CA', '2017-01-05', -56, 1, NULL, 2);
INSERT INTO "Readings" VALUES (568, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (569, 'SE', '2017-01-05', -1.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (570, 'CA', '2017-01-05', -61, 1, NULL, 2);
INSERT INTO "Readings" VALUES (571, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (572, 'SE', '2017-01-05', -1.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (573, 'CA', '2017-01-05', -70, 1, NULL, 2);
INSERT INTO "Readings" VALUES (574, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (575, 'SE', '2017-01-05', -1.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (576, 'CA', '2017-01-05', -70, 1, NULL, 2);
INSERT INTO "Readings" VALUES (577, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (578, 'SE', '2017-01-05', -1.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (579, 'CA', '2017-01-05', -70, 1, NULL, 2);
INSERT INTO "Readings" VALUES (580, 'SE', '2017-01-05', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (581, 'SE', '2017-01-05', -2.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (582, 'CA', '2017-01-05', -168, 1, NULL, 2);
INSERT INTO "Readings" VALUES (583, 'SE', '2017-01-05', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (584, 'SE', '2017-01-05', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (585, 'CA', '2017-01-05', -149, 1, NULL, 2);
INSERT INTO "Readings" VALUES (586, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (587, 'SE', '2017-01-05', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (588, 'CA', '2017-01-05', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (589, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (590, 'SE', '2017-01-05', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (591, 'CA', '2017-01-05', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (592, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (593, 'SE', '2017-01-05', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (594, 'CA', '2017-01-05', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (595, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (596, 'SE', '2017-01-05', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (597, 'CA', '2017-01-05', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (598, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (599, 'SE', '2017-01-05', -2.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (600, 'CA', '2017-01-05', -122, 1, NULL, 2);
INSERT INTO "Readings" VALUES (601, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (602, 'SE', '2017-01-05', -2.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (603, 'CA', '2017-01-05', -122, 1, NULL, 2);
INSERT INTO "Readings" VALUES (604, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (605, 'SE', '2017-01-05', -2.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (606, 'CA', '2017-01-05', -117, 1, NULL, 2);
INSERT INTO "Readings" VALUES (607, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (608, 'SE', '2017-01-05', -2.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (609, 'CA', '2017-01-05', -117, 1, NULL, 2);
INSERT INTO "Readings" VALUES (610, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (611, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (612, 'CA', '2017-01-05', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (613, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (614, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (615, 'CA', '2017-01-05', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (616, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (617, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (618, 'CA', '2017-01-05', -104, 1, NULL, 2);
INSERT INTO "Readings" VALUES (619, 'SE', '2017-01-05', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (620, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (621, 'CA', '2017-01-05', -104, 1, NULL, 2);
INSERT INTO "Readings" VALUES (622, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (623, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (624, 'CA', '2017-01-05', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (625, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (626, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (627, 'CA', '2017-01-05', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (628, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (629, 'SE', '2017-01-05', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (630, 'CA', '2017-01-05', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (631, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (632, 'SE', '2017-01-05', -2.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (633, 'CA', '2017-01-05', -106, 1, NULL, 2);
INSERT INTO "Readings" VALUES (634, 'SE', '2017-01-05', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (635, 'SE', '2017-01-05', -2.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (636, 'CA', '2017-01-05', -106, 1, NULL, 2);
INSERT INTO "Readings" VALUES (637, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (638, 'SE', '2017-01-06', -2.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (639, 'CA', '2017-01-06', -106, 1, NULL, 2);
INSERT INTO "Readings" VALUES (640, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (641, 'SE', '2017-01-06', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (642, 'CA', '2017-01-06', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (643, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (644, 'SE', '2017-01-06', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (645, 'CA', '2017-01-06', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (646, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (647, 'SE', '2017-01-06', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (648, 'CA', '2017-01-06', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (649, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (650, 'SE', '2017-01-06', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (651, 'CA', '2017-01-06', -104, 1, NULL, 2);
INSERT INTO "Readings" VALUES (652, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (653, 'SE', '2017-01-06', -2.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (654, 'CA', '2017-01-06', -111, 1, NULL, 2);
INSERT INTO "Readings" VALUES (655, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (656, 'SE', '2017-01-06', -2.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (657, 'CA', '2017-01-06', -109, 1, NULL, 2);
INSERT INTO "Readings" VALUES (658, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (659, 'SE', '2017-01-06', -2.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (660, 'CA', '2017-01-06', -109, 1, NULL, 2);
INSERT INTO "Readings" VALUES (661, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (662, 'SE', '2017-01-06', -2.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (663, 'CA', '2017-01-06', -114, 1, NULL, 2);
INSERT INTO "Readings" VALUES (664, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (665, 'SE', '2017-01-06', -2.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (666, 'CA', '2017-01-06', -122, 1, NULL, 2);
INSERT INTO "Readings" VALUES (667, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (668, 'SE', '2017-01-06', -2.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (669, 'CA', '2017-01-06', -135, 1, NULL, 2);
INSERT INTO "Readings" VALUES (670, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (671, 'SE', '2017-01-06', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (672, 'CA', '2017-01-06', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (673, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (674, 'SE', '2017-01-06', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (675, 'CA', '2017-01-06', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (676, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (677, 'SE', '2017-01-06', -2.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (678, 'CA', '2017-01-06', -128, 1, NULL, 2);
INSERT INTO "Readings" VALUES (679, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (680, 'SE', '2017-01-06', -3.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (681, 'CA', '2017-01-06', -231, 1, NULL, 2);
INSERT INTO "Readings" VALUES (682, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (683, 'SE', '2017-01-06', -3.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (684, 'CA', '2017-01-06', -173, 1, NULL, 2);
INSERT INTO "Readings" VALUES (685, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (686, 'SE', '2017-01-06', -3.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (687, 'CA', '2017-01-06', -185, 1, NULL, 2);
INSERT INTO "Readings" VALUES (688, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (689, 'SE', '2017-01-06', -3.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (690, 'CA', '2017-01-06', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (691, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (692, 'SE', '2017-01-06', -3.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (693, 'CA', '2017-01-06', -196, 1, NULL, 2);
INSERT INTO "Readings" VALUES (694, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (695, 'SE', '2017-01-06', -3.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (696, 'CA', '2017-01-06', -208, 1, NULL, 2);
INSERT INTO "Readings" VALUES (697, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (698, 'SE', '2017-01-06', -3.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (699, 'CA', '2017-01-06', -214, 1, NULL, 2);
INSERT INTO "Readings" VALUES (700, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (701, 'SE', '2017-01-06', -3.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (702, 'CA', '2017-01-06', -220, 1, NULL, 2);
INSERT INTO "Readings" VALUES (703, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (704, 'SE', '2017-01-06', -3.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (705, 'CA', '2017-01-06', -220, 1, NULL, 2);
INSERT INTO "Readings" VALUES (706, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (707, 'SE', '2017-01-06', -3.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (708, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (709, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (710, 'SE', '2017-01-06', -3.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (711, 'CA', '2017-01-06', -233, 1, NULL, 2);
INSERT INTO "Readings" VALUES (712, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (713, 'SE', '2017-01-06', -3.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (714, 'CA', '2017-01-06', -227, 1, NULL, 2);
INSERT INTO "Readings" VALUES (715, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (716, 'SE', '2017-01-06', -3.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (717, 'CA', '2017-01-06', -251, 1, NULL, 2);
INSERT INTO "Readings" VALUES (718, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (719, 'SE', '2017-01-06', -3.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (720, 'CA', '2017-01-06', -251, 1, NULL, 2);
INSERT INTO "Readings" VALUES (721, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (722, 'SE', '2017-01-06', -3.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (723, 'CA', '2017-01-06', -233, 1, NULL, 2);
INSERT INTO "Readings" VALUES (724, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (725, 'SE', '2017-01-06', -3.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (726, 'CA', '2017-01-06', -251, 1, NULL, 2);
INSERT INTO "Readings" VALUES (727, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (728, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (729, 'CA', '2017-01-06', -239, 1, NULL, 2);
INSERT INTO "Readings" VALUES (730, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (731, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (732, 'CA', '2017-01-06', -258, 1, NULL, 2);
INSERT INTO "Readings" VALUES (733, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (734, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (735, 'CA', '2017-01-06', -239, 1, NULL, 2);
INSERT INTO "Readings" VALUES (736, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (737, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (738, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (739, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (740, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (741, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (742, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (743, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (744, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (745, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (746, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (747, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (748, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (749, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (750, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (751, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (752, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (753, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (754, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (755, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (756, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (757, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (758, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (759, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (760, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (761, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (762, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (763, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (764, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (765, 'CA', '2017-01-06', -252, 1, NULL, 2);
INSERT INTO "Readings" VALUES (766, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (767, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (768, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (769, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (770, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (771, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (772, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (773, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (774, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (775, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (776, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (777, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (778, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (779, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (780, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (781, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (782, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (783, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (784, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (785, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (786, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (787, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (788, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (789, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (790, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (791, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (792, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (793, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (794, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (795, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (796, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (797, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (798, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (799, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (800, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (801, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (802, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (803, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (804, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (805, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (806, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (807, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (808, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (809, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (810, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (811, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (812, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (813, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (814, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (815, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (816, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (817, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (818, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (819, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (820, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (821, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (822, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (823, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (824, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (825, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (826, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (827, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (828, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (829, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (830, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (831, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (832, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (833, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (834, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (835, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (836, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (837, 'CA', '2017-01-06', -279, 1, NULL, 2);
INSERT INTO "Readings" VALUES (838, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (839, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (840, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (841, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (842, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (843, 'CA', '2017-01-06', -296, 1, NULL, 2);
INSERT INTO "Readings" VALUES (844, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (845, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (846, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (847, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (848, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (849, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (850, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (851, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (852, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (853, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (854, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (855, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (856, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (857, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (858, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (859, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (860, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (861, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (862, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (863, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (864, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (865, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (866, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (867, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (868, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (869, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (870, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (871, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (872, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (873, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (874, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (875, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (876, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (877, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (878, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (879, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (880, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (881, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (882, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (883, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (884, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (885, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (886, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (887, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (888, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (889, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (890, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (891, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (892, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (893, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (894, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (895, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (896, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (897, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (898, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (899, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (900, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (901, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (902, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (903, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (904, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (905, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (906, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (907, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (908, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (909, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (910, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (911, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (912, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (913, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (914, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (915, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (916, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (917, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (918, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (919, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (920, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (921, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (922, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (923, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (924, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (925, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (926, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (927, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (928, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (929, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (930, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (931, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (932, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (933, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (934, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (935, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (936, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (937, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (938, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (939, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (940, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (941, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (942, 'CA', '2017-01-06', -258, 1, NULL, 2);
INSERT INTO "Readings" VALUES (943, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (944, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (945, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (946, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (947, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (948, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (949, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (950, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (951, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (952, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (953, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (954, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (955, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (956, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (957, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (958, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (959, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (960, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (961, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (962, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (963, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (964, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (965, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (966, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (967, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (968, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (969, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (970, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (971, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (972, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (973, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (974, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (975, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (976, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (977, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (978, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (979, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (980, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (981, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (982, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (983, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (984, 'CA', '2017-01-06', -307, 1, NULL, 2);
INSERT INTO "Readings" VALUES (985, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (986, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (987, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (988, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (989, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (990, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (991, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (992, 'SE', '2017-01-06', -3.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (993, 'CA', '2017-01-06', -280, 1, NULL, 2);
INSERT INTO "Readings" VALUES (994, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (995, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (996, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (997, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (998, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (999, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1000, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1001, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1002, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1003, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1004, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1005, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1006, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1007, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1008, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1009, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1010, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1011, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1012, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1013, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1014, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1015, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1016, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1017, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1018, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1019, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1020, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1021, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1022, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1023, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1024, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1025, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1026, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1027, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1028, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1029, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1030, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1031, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1032, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1033, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1034, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1035, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1036, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1037, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1038, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1039, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1040, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1041, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1042, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1043, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1044, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1045, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1046, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1047, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1048, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1049, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1050, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1051, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1052, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1053, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1054, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1055, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1056, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1057, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1058, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1059, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1060, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1061, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1062, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1063, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1064, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1065, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1066, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1067, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1068, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1069, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1070, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1071, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1072, 'SE', '2017-01-06', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1073, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1074, 'CA', '2017-01-06', -391, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1075, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1076, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1077, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1078, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1079, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1080, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1081, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1082, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1083, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1084, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1085, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1086, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1087, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1088, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1089, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1090, 'SE', '2017-01-06', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1091, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1092, 'CA', '2017-01-06', -391, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1093, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1094, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1095, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1096, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1097, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1098, 'CA', '2017-01-06', -359, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1099, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1100, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1101, 'CA', '2017-01-06', -359, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1102, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1103, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1104, 'CA', '2017-01-06', -349, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1105, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1106, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1107, 'CA', '2017-01-06', -316, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1108, 'SE', '2017-01-06', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1109, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1110, 'CA', '2017-01-06', -391, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1111, 'SE', '2017-01-06', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1112, 'SE', '2017-01-06', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1113, 'CA', '2017-01-06', -486, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1114, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1115, 'SE', '2017-01-06', -4.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1116, 'CA', '2017-01-06', -467, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1117, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1118, 'SE', '2017-01-06', -5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1119, 'CA', '2017-01-06', -478, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1120, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1121, 'SE', '2017-01-06', -5.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1122, 'CA', '2017-01-06', -490, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1123, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1124, 'SE', '2017-01-06', -5.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1125, 'CA', '2017-01-06', -490, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1126, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1127, 'SE', '2017-01-06', -5.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1128, 'CA', '2017-01-06', -490, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1129, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1130, 'SE', '2017-01-06', -5.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1131, 'CA', '2017-01-06', -490, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1132, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1133, 'SE', '2017-01-06', -5.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1134, 'CA', '2017-01-06', -490, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1135, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1136, 'SE', '2017-01-06', -5.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1137, 'CA', '2017-01-06', -490, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1138, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1139, 'SE', '2017-01-06', -5.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1140, 'CA', '2017-01-06', -515, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1141, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1142, 'SE', '2017-01-06', -5.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1143, 'CA', '2017-01-06', -515, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1144, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1145, 'SE', '2017-01-06', -5.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1146, 'CA', '2017-01-06', -515, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1147, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1148, 'SE', '2017-01-06', -5.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1149, 'CA', '2017-01-06', -472, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1150, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1151, 'SE', '2017-01-06', -5.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1152, 'CA', '2017-01-06', -472, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1153, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1154, 'SE', '2017-01-06', -5.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1155, 'CA', '2017-01-06', -472, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1156, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1157, 'SE', '2017-01-06', -5.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1158, 'CA', '2017-01-06', -540, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1159, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1160, 'SE', '2017-01-06', -5.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1161, 'CA', '2017-01-06', -540, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1162, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1163, 'SE', '2017-01-06', -5.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1164, 'CA', '2017-01-06', -540, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1165, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1166, 'SE', '2017-01-06', -5.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1167, 'CA', '2017-01-06', -494, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1168, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1169, 'SE', '2017-01-06', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1170, 'CA', '2017-01-06', -506, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1171, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1172, 'SE', '2017-01-06', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1173, 'CA', '2017-01-06', -506, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1174, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1175, 'SE', '2017-01-06', -5.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1176, 'CA', '2017-01-06', -554, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1177, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1178, 'SE', '2017-01-06', -5.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1179, 'CA', '2017-01-06', -483, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1180, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1181, 'SE', '2017-01-06', -5.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1182, 'CA', '2017-01-06', -472, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1183, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1184, 'SE', '2017-01-06', -5.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1185, 'CA', '2017-01-06', -461, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1186, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1187, 'SE', '2017-01-06', -5.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1188, 'CA', '2017-01-06', -502, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1189, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1190, 'SE', '2017-01-06', -7.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1191, 'CA', '2017-01-06', -984, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1192, 'SE', '2017-01-06', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1193, 'SE', '2017-01-06', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1194, 'CA', '2017-01-06', -371, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1195, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1196, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1197, 'CA', '2017-01-06', -296, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1198, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1199, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1200, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1201, 'SE', '2017-01-06', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1202, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1203, 'CA', '2017-01-06', -288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1204, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1205, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1206, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1207, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1208, 'SE', '2017-01-06', -4, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1209, 'CA', '2017-01-06', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1210, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1211, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1212, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1213, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1214, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1215, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1216, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1217, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1218, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1219, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1220, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1221, 'CA', '2017-01-06', -252, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1222, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1223, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1224, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1225, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1226, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1227, 'CA', '2017-01-06', -252, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1228, 'SE', '2017-01-06', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1229, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1230, 'CA', '2017-01-06', -272, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1231, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1232, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1233, 'CA', '2017-01-06', -252, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1234, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1235, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1236, 'CA', '2017-01-06', -252, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1237, 'SE', '2017-01-06', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1238, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1239, 'CA', '2017-01-06', -252, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1240, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1241, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1242, 'CA', '2017-01-06', -235, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1243, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1244, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1245, 'CA', '2017-01-06', -235, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1246, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1247, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1248, 'CA', '2017-01-06', -235, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1249, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1250, 'SE', '2017-01-06', -4.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1251, 'CA', '2017-01-06', -235, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1252, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1253, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1254, 'CA', '2017-01-06', -240, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1255, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1256, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1257, 'CA', '2017-01-06', -240, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1258, 'SE', '2017-01-06', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1259, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1260, 'CA', '2017-01-06', -240, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1261, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1262, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1263, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1264, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1265, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1266, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1267, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1268, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1269, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1270, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1271, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1272, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1273, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1274, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1275, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1276, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1277, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1278, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1279, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1280, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1281, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1282, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1283, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1284, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1285, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1286, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1287, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1288, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1289, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1290, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1291, 'SE', '2017-01-06', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1292, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1293, 'CA', '2017-01-06', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1294, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1295, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1296, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1297, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1298, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1299, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1300, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1301, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1302, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1303, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1304, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1305, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1306, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1307, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1308, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1309, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1310, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1311, 'CA', '2017-01-06', -199, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1312, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1313, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1314, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1315, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1316, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1317, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1318, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1319, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1320, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1321, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1322, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1323, 'CA', '2017-01-06', -199, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1324, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1325, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1326, 'CA', '2017-01-06', -216, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1327, 'SE', '2017-01-06', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1328, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1329, 'CA', '2017-01-06', -211, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1330, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1331, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1332, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1333, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1334, 'SE', '2017-01-06', -4.125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1335, 'CA', '2017-01-06', -199, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1336, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1337, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1338, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1339, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1340, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1341, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1342, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1343, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1344, 'CA', '2017-01-06', -193, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1345, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1346, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1347, 'CA', '2017-01-06', -193, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1348, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1349, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1350, 'CA', '2017-01-06', -193, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1351, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1352, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1353, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1354, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1355, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1356, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1357, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1358, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1359, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1360, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1361, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1362, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1363, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1364, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1365, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1366, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1367, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1368, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1369, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1370, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1371, 'CA', '2017-01-06', -204, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1372, 'SE', '2017-01-06', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1373, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1374, 'CA', '2017-01-06', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1375, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1376, 'SE', '2017-01-06', -4.1875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1377, 'CA', '2017-01-06', -193, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1378, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1379, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1380, 'CA', '2017-01-06', -197, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1381, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1382, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1383, 'CA', '2017-01-06', -197, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1384, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1385, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1386, 'CA', '2017-01-06', -197, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1387, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1388, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1389, 'CA', '2017-01-06', -197, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1390, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1391, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1392, 'CA', '2017-01-06', -197, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1393, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1394, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1395, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1396, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1397, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1398, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1399, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1400, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1401, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1402, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1403, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1404, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1405, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1406, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1407, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1408, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1409, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1410, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1411, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1412, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1413, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1414, 'SE', '2017-01-06', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1415, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1416, 'CA', '2017-01-06', -197, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1417, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1418, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1419, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1420, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1421, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1422, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1423, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1424, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1425, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1426, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1427, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1428, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1429, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1430, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1431, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1432, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1433, 'SE', '2017-01-06', -4.25, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1434, 'CA', '2017-01-06', -187, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1435, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1436, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1437, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1438, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1439, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1440, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1441, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1442, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1443, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1444, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1445, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1446, 'CA', '2017-01-06', -191, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1447, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1448, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1449, 'CA', '2017-01-06', -191, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1450, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1451, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1452, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1453, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1454, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1455, 'CA', '2017-01-06', -191, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1456, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1457, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1458, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1459, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1460, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1461, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1462, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1463, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1464, 'CA', '2017-01-06', -191, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1465, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1466, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1467, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1468, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1469, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1470, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1471, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1472, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1473, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1474, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1475, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1476, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1477, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1478, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1479, 'CA', '2017-01-06', -182, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1480, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1481, 'SE', '2017-01-06', -4.3125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1482, 'CA', '2017-01-06', -191, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1483, 'SE', '2017-01-06', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1484, 'SE', '2017-01-06', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1485, 'CA', '2017-01-06', -196, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1486, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1487, 'SE', '2017-01-06', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1488, 'CA', '2017-01-06', -186, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1489, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1490, 'SE', '2017-01-06', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1491, 'CA', '2017-01-06', -186, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1492, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1493, 'SE', '2017-01-06', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1494, 'CA', '2017-01-06', -186, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1495, 'SE', '2017-01-06', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1496, 'SE', '2017-01-06', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1497, 'CA', '2017-01-06', -186, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1498, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1499, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1500, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1501, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1502, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1503, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1504, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1505, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1506, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1507, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1508, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1509, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1510, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1511, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1512, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1513, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1514, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1515, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1516, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1517, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1518, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1519, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1520, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1521, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1522, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1523, 'SE', '2017-01-07', -4.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1524, 'CA', '2017-01-07', -177, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1525, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1526, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1527, 'CA', '2017-01-07', -181, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1528, 'SE', '2017-01-07', -13.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1529, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1530, 'CA', '2017-01-07', -181, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1531, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1532, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1533, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1534, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1535, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1536, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1537, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1538, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1539, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1540, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1541, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1542, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1543, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1544, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1545, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1546, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1547, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1548, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1549, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1550, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1551, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1552, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1553, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1554, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1555, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1556, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1557, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1558, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1559, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1560, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1561, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1562, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1563, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1564, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1565, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1566, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1567, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1568, 'SE', '2017-01-07', -4.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1569, 'CA', '2017-01-07', -190, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1570, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1571, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1572, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1573, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1574, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1575, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1576, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1577, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1578, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1579, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1580, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1581, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1582, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1583, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1584, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1585, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1586, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1587, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1588, 'SE', '2017-01-07', -13, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1589, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1590, 'CA', '2017-01-07', -194, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1591, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1592, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1593, 'CA', '2017-01-07', -205, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1594, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1595, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1596, 'CA', '2017-01-07', -205, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1597, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1598, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1599, 'CA', '2017-01-07', -205, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1600, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1601, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1602, 'CA', '2017-01-07', -205, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1603, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1604, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1605, 'CA', '2017-01-07', -205, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1606, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1607, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1608, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1609, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1610, 'SE', '2017-01-07', -4.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1611, 'CA', '2017-01-07', -205, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1612, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1613, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1614, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1615, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1616, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1617, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1618, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1619, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1620, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1621, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1622, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1623, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1624, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1625, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1626, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1627, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1628, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1629, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1630, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1631, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1632, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1633, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1634, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1635, 'CA', '2017-01-07', -209, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1636, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1637, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1638, 'CA', '2017-01-07', -221, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1639, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1640, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1641, 'CA', '2017-01-07', -221, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1642, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1643, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1644, 'CA', '2017-01-07', -221, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1645, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1646, 'SE', '2017-01-07', -4.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1647, 'CA', '2017-01-07', -221, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1648, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1649, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1650, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1651, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1652, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1653, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1654, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1655, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1656, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1657, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1658, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1659, 'CA', '2017-01-07', -213, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1660, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1661, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1662, 'CA', '2017-01-07', -213, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1663, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1664, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1665, 'CA', '2017-01-07', -213, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1666, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1667, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1668, 'CA', '2017-01-07', -213, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1669, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1670, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1671, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1672, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1673, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1674, 'CA', '2017-01-07', -213, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1675, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1676, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1677, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1678, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1679, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1680, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1681, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1682, 'SE', '2017-01-07', -4.625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1683, 'CA', '2017-01-07', -225, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1684, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1685, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1686, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1687, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1688, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1689, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1690, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1691, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1692, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1693, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1694, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1695, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1696, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1697, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1698, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1699, 'SE', '2017-01-07', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1700, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1701, 'CA', '2017-01-07', -244, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1702, 'SE', '2017-01-07', -12.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1703, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1704, 'CA', '2017-01-07', -218, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1705, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1706, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1707, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1708, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1709, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1710, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1711, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1712, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1713, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1714, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1715, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1716, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1717, 'SE', '2017-01-07', -12, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1718, 'SE', '2017-01-07', -4.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1719, 'CA', '2017-01-07', -230, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1720, 'SE', '2017-01-07', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1721, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1722, 'CA', '2017-01-07', -249, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1723, 'SE', '2017-01-07', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1724, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1725, 'CA', '2017-01-07', -249, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1726, 'SE', '2017-01-07', -11.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1727, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1728, 'CA', '2017-01-07', -249, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1729, 'SE', '2017-01-07', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1730, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1731, 'CA', '2017-01-07', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1732, 'SE', '2017-01-07', -11, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1733, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1734, 'CA', '2017-01-07', -265, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1735, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1736, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1737, 'CA', '2017-01-07', -304, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1738, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1739, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1740, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1741, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1742, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1743, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1744, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1745, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1746, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1747, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1748, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1749, 'CA', '2017-01-07', -304, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1750, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1751, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1752, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1753, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1754, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1755, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1756, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1757, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1758, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1759, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1760, 'SE', '2017-01-07', -4.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1761, 'CA', '2017-01-07', -283, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1762, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1763, 'SE', '2017-01-07', -4.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1764, 'CA', '2017-01-07', -289, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1765, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1766, 'SE', '2017-01-07', -4.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1767, 'CA', '2017-01-07', -311, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1768, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1769, 'SE', '2017-01-07', -4.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1770, 'CA', '2017-01-07', -289, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1771, 'SE', '2017-01-07', -10.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1772, 'SE', '2017-01-07', -4.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1773, 'CA', '2017-01-07', -289, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1774, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1775, 'SE', '2017-01-07', -4.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1776, 'CA', '2017-01-07', -311, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1777, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1778, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1779, 'CA', '2017-01-07', -383, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1780, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1781, 'SE', '2017-01-07', -5.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1782, 'CA', '2017-01-07', -376, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1783, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1784, 'SE', '2017-01-07', -5.375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1785, 'CA', '2017-01-07', -376, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1786, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1787, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1788, 'CA', '2017-01-07', -383, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1789, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1790, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1791, 'CA', '2017-01-07', -383, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1792, 'SE', '2017-01-07', -10, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1793, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1794, 'CA', '2017-01-07', -383, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1795, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1796, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1797, 'CA', '2017-01-07', -417, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1798, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1799, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1800, 'CA', '2017-01-07', -417, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1801, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1802, 'SE', '2017-01-07', -5.4375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1803, 'CA', '2017-01-07', -417, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1804, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1805, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1806, 'CA', '2017-01-07', -425, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1807, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1808, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1809, 'CA', '2017-01-07', -425, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1810, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1811, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1812, 'CA', '2017-01-07', -425, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1813, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1814, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1815, 'CA', '2017-01-07', -467, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1816, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1817, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1818, 'CA', '2017-01-07', -425, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1819, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1820, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1821, 'CA', '2017-01-07', -425, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1822, 'SE', '2017-01-07', -9.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1823, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1824, 'CA', '2017-01-07', -425, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1825, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1826, 'SE', '2017-01-07', -5.5, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1827, 'CA', '2017-01-07', -467, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1828, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1829, 'SE', '2017-01-07', -5.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1830, 'CA', '2017-01-07', -477, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1831, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1832, 'SE', '2017-01-07', -5.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1833, 'CA', '2017-01-07', -477, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1834, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1835, 'SE', '2017-01-07', -5.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1836, 'CA', '2017-01-07', -477, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1837, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1838, 'SE', '2017-01-07', -5.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1839, 'CA', '2017-01-07', -477, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1840, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1841, 'SE', '2017-01-07', -5.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1842, 'CA', '2017-01-07', -477, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1843, 'SE', '2017-01-07', -9, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1844, 'SE', '2017-01-07', -5.5625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1845, 'CA', '2017-01-07', -477, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1846, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1847, 'SE', '2017-01-07', -4.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1848, 'CA', '2017-01-07', -420, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1849, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1850, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1851, 'CA', '2017-01-07', -554, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1852, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1853, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1854, 'CA', '2017-01-07', -554, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1855, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1856, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1857, 'CA', '2017-01-07', -554, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1858, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1859, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1860, 'CA', '2017-01-07', -554, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1861, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1862, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1863, 'CA', '2017-01-07', -566, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1864, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1865, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1866, 'CA', '2017-01-07', -566, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1867, 'SE', '2017-01-07', -8.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1868, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1869, 'CA', '2017-01-07', -566, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1870, 'SE', '2017-01-07', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1871, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1872, 'CA', '2017-01-07', -625, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1873, 'SE', '2017-01-07', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1874, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1875, 'CA', '2017-01-07', -625, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1876, 'SE', '2017-01-07', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1877, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1878, 'CA', '2017-01-07', -625, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1879, 'SE', '2017-01-07', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1880, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1881, 'CA', '2017-01-07', -625, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1882, 'SE', '2017-01-07', -8, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1883, 'SE', '2017-01-07', -5.6875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1884, 'CA', '2017-01-07', -625, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1885, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1886, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1887, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1888, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1889, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1890, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1891, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1892, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1893, 'CA', '2017-01-07', -886, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1894, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1895, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1896, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1897, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1898, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1899, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1900, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1901, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1902, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1903, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1904, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1905, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1906, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1907, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1908, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1909, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1910, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1911, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1912, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1913, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1914, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1915, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1916, 'SE', '2017-01-07', -5.75, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1917, 'CA', '2017-01-07', -741, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1918, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1919, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1920, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1921, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1922, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1923, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1924, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1925, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1926, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1927, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1928, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1929, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1930, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1931, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1932, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1933, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1934, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1935, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1936, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1937, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1938, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1939, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1940, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1941, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1942, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1943, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1944, 'CA', '2017-01-07', -1174, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1945, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1946, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1947, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1948, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1949, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1950, 'CA', '2017-01-07', -915, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1951, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1952, 'SE', '2017-01-07', -5.8125, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1953, 'CA', '2017-01-07', -761, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1954, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1955, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1956, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1957, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1958, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1959, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1960, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1961, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1962, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1963, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1964, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1965, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1966, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1967, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1968, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1969, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1970, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1971, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1972, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1973, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1974, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1975, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1976, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1977, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1978, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1979, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1980, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1981, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1982, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1983, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1984, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1985, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1986, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1987, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1988, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1989, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1990, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1991, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1992, 'CA', '2017-01-07', -945, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1993, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1994, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1995, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1996, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (1997, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (1998, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (1999, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2000, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2001, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2002, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2003, 'SE', '2017-01-07', -5.875, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2004, 'CA', '2017-01-07', -783, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2005, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2006, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2007, 'CA', '2017-01-07', -805, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2008, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2009, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2010, 'CA', '2017-01-07', -805, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2011, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2012, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2013, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2014, 'SE', '2017-01-07', -7.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2015, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2016, 'CA', '2017-01-07', -805, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2017, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2018, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2019, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2020, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2021, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2022, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2023, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2024, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2025, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2026, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2027, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2028, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2029, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2030, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2031, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2032, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2033, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2034, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2035, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2036, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2037, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2038, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2039, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2040, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2041, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2042, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2043, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2044, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2045, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2046, 'CA', '2017-01-07', -1288, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2047, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2048, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2049, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2050, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2051, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2052, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2053, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2054, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2055, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2056, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2057, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2058, 'CA', '2017-01-07', -1012, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2059, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2060, 'SE', '2017-01-07', -5.9375, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2061, 'CA', '2017-01-07', -978, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2062, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2063, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2064, 'CA', '2017-01-07', -1012, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2065, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2066, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2067, 'CA', '2017-01-07', -1012, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2068, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2069, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2070, 'CA', '2017-01-07', -1012, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2071, 'SE', '2017-01-07', -7, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2072, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2073, 'CA', '2017-01-07', -1012, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2074, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2075, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2076, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2077, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2078, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2079, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2080, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2081, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2082, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2083, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2084, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2085, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2086, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2087, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2088, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2089, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2090, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2091, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2092, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2093, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2094, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2095, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2096, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2097, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2098, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2099, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2100, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2101, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2102, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2103, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2104, 'SE', '2017-01-07', -6.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2105, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2106, 'CA', '2017-01-07', -1354, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2107, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2108, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2109, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2110, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2111, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2112, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2113, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2114, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2115, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2116, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2117, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2118, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2119, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2120, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2121, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2122, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2123, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2124, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2125, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2126, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2127, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2128, 'SE', '2017-01-07', -6, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2129, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2130, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2131, 'SE', '2017-01-07', -5.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2132, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2133, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2134, 'SE', '2017-01-07', -5.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2135, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2136, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2137, 'SE', '2017-01-07', -5.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2138, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2139, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2140, 'SE', '2017-01-07', -5.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2141, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2142, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2143, 'SE', '2017-01-07', -5.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2144, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2145, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2146, 'SE', '2017-01-07', -5.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2147, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2148, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2149, 'SE', '2017-01-07', -5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2150, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2151, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2152, 'SE', '2017-01-07', -5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2153, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2154, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2155, 'SE', '2017-01-07', -5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2156, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2157, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2158, 'SE', '2017-01-07', -5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2159, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2160, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2161, 'SE', '2017-01-07', -5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2162, 'SE', '2017-01-07', -6, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2163, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2164, 'SE', '2017-01-07', -5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2165, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2166, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2167, 'SE', '2017-01-07', -4.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2168, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2169, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2170, 'SE', '2017-01-07', -4.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2171, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2172, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2173, 'SE', '2017-01-07', -4.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2174, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2175, 'CA', '2017-01-07', -1, 1, NULL, 2);
INSERT INTO "Readings" VALUES (2176, 'SE', '2017-01-07', -4.5, 1, 1, NULL);
INSERT INTO "Readings" VALUES (2177, 'SE', '2017-01-07', -6.0625, 1, 2, NULL);
INSERT INTO "Readings" VALUES (2178, 'CA', '2017-01-07', -1, 1, NULL, 2);


--
-- TOC entry 2254 (class 0 OID 24625)
-- Dependencies: 194
-- Data for Name: SensorRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "SensorRoles" VALUES (1, 1, '28-FF-6D-5E-53-15-01-AA', 'Ambient');
INSERT INTO "SensorRoles" VALUES (2, 1, '28-FF-7D-97-01-15-02-AA', 'Beer');


--
-- TOC entry 2248 (class 0 OID 24586)
-- Dependencies: 188
-- Data for Name: Sensors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Sensors" VALUES ('28-FF-6D-5E-53-15-01-AA', 'Yellow');
INSERT INTO "Sensors" VALUES ('28-FF-7D-97-01-15-02-AA', 'Unmarked');


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 191
-- Name: calculators_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('calculators_seq', 3, true);


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 189
-- Name: measurements_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('measurements_seq', 6, true);


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 195
-- Name: readings_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('readings_seq', 2178, true);


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 193
-- Name: sensorroles_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sensorroles_seq', 2, true);


-- Completed on 2017-01-24 03:30:28 EET

--
-- PostgreSQL database dump complete
--

