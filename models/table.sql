CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    photo VARCHAR,
    cover VARCHAR,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR(12) NOT NULL,
    role VARCHAR,
    created_at TIMESTAMP DEFAULT NOW(),
    is_deleted SMALLINT DEFAULT 0
);
CREATE TABLE page (
    id SERIAL PRIMARY KEY,
    photo VARCHAR,
    cover VARCHAR,
    user_id INTEGER,
    namePage VARCHAR NOT NULL,
    password VARCHAR(12) NOT NULL,
    role VARCHAR,
    FOREIGN Key user_id REFERENCES users(id),
    is_deleted SMALLINT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
);
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    video VARCHAR,
    body TEXT,
    user_id INTEGER,
    photo VARCHAR,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY user_id REFERENCES users(id),
    is_deleted SMALLINT DEFAULT 0
);
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    comment VARCHAR,
    commenter INTEGER,
    post_id INTEGER,
    story_id INTEGER,
    reels_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    is_deleted SMALLINT DEFAULT 0,
    FOREIGN KEY commenter REFERENCES users(id),
    FOREIGN KEY post_id REFERENCES posts(id),
    FOREIGN KEY story_id REFERENCES story(id),
    FOREIGN KEY reels_id REFERENCES reels(id)
);
CREATE TABLE story (
    id SERIAL PRIMARY KEY,
    photo_video VARCHAR,
    user_id INTEGER NOT NULL,
    comment_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    end_at TIMESTAMP DEFAULT DAY,
    FOREIGN Key user_id REFERENCES users(id),
    is_deleted SMALLINT DEFAULT 0,
);
CREATE TABLE reels (
    id SERIAL PRIMARY KEY,
    video VARCHAR,
    comment VARCHAR,
    user_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN Key user_id REFERENCES users(id),
    is_deleted SMALLINT DEFAULT 0,
);
CREATE TABLE follows (
    following_user_id INTEGER,
    followed_user_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN Key following_user_id REFERENCES users(id),
    FOREIGN Key followed_user_id REFERENCES users(id),
    is_deleted SMALLINT DEFAULT 0
);
CREATE TABLE likes (
    like_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    is_read BOOLEAN DEFAULT FALSE
);