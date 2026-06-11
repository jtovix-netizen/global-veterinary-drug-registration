-- 创建数据库扩展
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- 国家表
CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    code VARCHAR(10) UNIQUE NOT NULL,
    region VARCHAR(50) NOT NULL,
    regulatory_body VARCHAR(200) NOT NULL,
    website VARCHAR(500),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_countries_code ON countries(code);
CREATE INDEX idx_countries_region ON countries(region);

-- 法规表
CREATE TABLE regulations (
    id SERIAL PRIMARY KEY,
    country_id INTEGER NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
    title VARCHAR(500) NOT NULL,
    regulation_number VARCHAR(100),
    version VARCHAR(50),
    effective_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    description TEXT,
    registration_requirements TEXT,
    processing_time_days INTEGER,
    registration_fee DECIMAL(10, 2),
    url VARCHAR(500),
    language VARCHAR(50) DEFAULT 'English',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_regulations_country_id ON regulations(country_id);
CREATE INDEX idx_regulations_effective_date ON regulations(effective_date);

-- 产品表
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(500) NOT NULL,
    active_ingredient VARCHAR(500) NOT NULL,
    formulation VARCHAR(200),
    strength VARCHAR(200),
    target_species VARCHAR(500) NOT NULL,
    therapeutic_indication TEXT,
    route_of_administration VARCHAR(200) NOT NULL,
    product_type VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(500),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_products_product_type ON products(product_type);
CREATE INDEX idx_products_target_species ON products(target_species);

-- 注册建议表
CREATE TABLE registration_advice (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    country_id INTEGER NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
    registration_pathway VARCHAR(200),
    registration_type VARCHAR(100),
    required_documents JSON,
    document_requirements TEXT,
    estimated_timeline_days INTEGER,
    estimated_cost DECIMAL(10, 2),
    key_recommendations TEXT,
    application_guidance TEXT,
    risks_and_considerations TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_advice_product_id ON registration_advice(product_id);
CREATE INDEX idx_advice_country_id ON registration_advice(country_id);
CREATE UNIQUE INDEX idx_advice_product_country ON registration_advice(product_id, country_id);

-- 初始数据
INSERT INTO countries (name, code, region, regulatory_body, website, description) VALUES
('China', 'CN', 'Asia', 'China National Administration of Traditional Chinese Medicine (SATCM)', 'http://www.satcm.gov.cn', 'CNAS veterinary drug registration in China'),
('United States', 'US', 'North America', 'Food and Drug Administration (FDA)', 'http://www.fda.gov', 'FDA Center for Veterinary Medicine (CVM)'),
('European Union', 'EU', 'Europe', 'European Medicines Agency (EMA)', 'http://www.ema.europa.eu', 'EMA Committee for Medicinal Products for Veterinary Use (CVMP)'),
('Japan', 'JP', 'Asia', 'Ministry of Health, Labour and Welfare (MHLW)', 'http://www.mhlw.go.jp', 'Japanese veterinary drug registration system');

INSERT INTO regulations (country_id, title, regulation_number, version, effective_date, description, processing_time_days, registration_fee, language) VALUES
(1, 'Veterinary Pharmaceutical Products Registration Rules', 'SATCM 2023', 'v2.0', '2023-01-01', 'Chinese regulations for veterinary drug registration', 180, 5000, 'Chinese'),
(2, 'Animal Drug User Fee Act (ADUFA)', 'CFR 21 Part 510', 'v1.0', '2022-01-01', 'FDA regulations for veterinary drug approval', 360, 8000, 'English'),
(3, 'Regulation (EC) No 726/2004', 'EU Reg 726/2004', 'v3.0', '2023-06-01', 'EMA centralized procedure for veterinary medicines', 210, 12000, 'English'),
(4, 'Pharmaceutical Affairs Law', 'PAL 2019', 'v1.0', '2019-04-01', 'Japanese veterinary drug approval process', 240, 4000, 'English');
