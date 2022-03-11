CREATE TABLE `user`
(
    id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(50) NOT NULL UNIQUE,
    password CHAR(128)   NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `contact`
(
    id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    address TEXT DEFAULT NULL,
    phone   CHAR(13),
    user_id INT UNSIGNED UNIQUE,

    FOREIGN KEY (user_id)
        REFERENCES user (id)
        ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

ALTER TABLE `user`
    ADD COLUMN
        contact_id INT UNSIGNED UNIQUE;

ALTER TABLE `user`
    ADD CONSTRAINT contactfk
        FOREIGN KEY (contact_id)
            REFERENCES contact (id);

CREATE TABLE `permission`
(
    id   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `user_perm_rel`
(
    user_id INT UNSIGNED,
    perm_id INT UNSIGNED,

    PRIMARY KEY (user_id, perm_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (perm_id) REFERENCES permission(id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
