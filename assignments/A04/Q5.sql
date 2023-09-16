CREATE TABLE markets(
    m_id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    m_name VARCHAR(255) NOT NULL,
    m_address TEXT NOT NULL,
    level INT NOT NULL,
    m_score BIGINT NOT NULL
);

CREATE TABLE capacities(
    level INT PRIMARY KEY NOT NULL,
    capacity BIGINT NOT NULL
);

CREATE TABLE products(
    p_id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    p_name VARCHAR(255) NOT NULL,
    p_weight BIGINT NOT NULL
);

CREATE TABLE prices (
    p_id BIGINT NOT NULL,
    m_id BIGINT NOT NULL,
    price BIGINT NOT NULL,
    PRIMARY KEY (p_id, m_id)
);

ALTER TABLE
    markets
ADD
    CONSTRAINT fk_markets_level FOREIGN KEY (level) REFERENCES capacities(level);

ALTER TABLE
    prices
ADD
    CONSTRAINT fk_prices_products FOREIGN KEY (p_id) REFERENCES products(p_id);

ALTER TABLE
    prices
ADD
    CONSTRAINT fk_prices_markets FOREIGN KEY (m_id) REFERENCES markets(m_id);
