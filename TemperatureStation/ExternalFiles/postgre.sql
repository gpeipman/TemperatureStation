--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-01-01 22:26:26 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 189 (class 1259 OID 24591)
-- Name: measurements_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE measurements_seq
    START WITH 1
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
    START WITH 1
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
    START WITH 1
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
    START WITH 1
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


CREATE VIEW MeasurementStats AS
	SELECT        
		sr.RoleName As Name,
		sr.MeasurementId,
		MIN(r.Value) As Min,
		MAX(r.Value) As Max
	FROM
		Readings r
		INNER JOIN SensorRoles sr ON 
			r.SensorRoleId = sr.Id
	GROUP BY
		sr.RoleName,
		sr.MeasurementId

	UNION

	SELECT
		c.Name,
		c.MeasurementId,
		MIN(r.Value) As Min,
		MAX(r.Value) As Max
	FROM 
		Readings r 
		INNER JOIN Calculators c ON
			r.CalculatorId = c.Id
	GROUP BY
		c.Name,
		c.MeasurementId;

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-01-01 22:26:26 EET

--
-- PostgreSQL database dump complete
--

