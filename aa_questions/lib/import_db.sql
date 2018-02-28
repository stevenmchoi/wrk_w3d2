CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);



CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  user_like INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Steven', 'Choi'),
  ('Gabriel', 'Talavera');


INSERT INTO
  questions (title, body, user_id)
VALUES
  ('CSS hard!', 'how do I do this?', 1),
  ('SQL hard!', 'waht iz squl?', 2),
  ('halkdjf', 'lkajdflkaj', 1),
  ('SQL fdahard!', 'wadfht iz squl?', 2),
  ('halkddfafdsajf', 'lkajdfdflkaj', 1),
  ('halkddfafdsajf', 'lkajdfdflkaj', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (2, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (2, 3),
  (2, 4),
  (2, 5);


INSERT INTO
  replies (parent_reply_id, question_id, user_id, body)
VALUES
  (NULL, 2, 1, "don't worry about it!"),
  (1, 2, 2, "Thats no help!"),
  (NULL, 1, 2, "what? it's easy!");

INSERT INTO
  question_likes (question_id, user_id, user_like)
VALUES
  (1, 1, 1),
  (1, 2, 0),
  (2, 1, 0),
  (2, 2, 1),
  (3, 1, 1),
  (3, 2, 1),
  (4, 1, 0),
  (4, 2, 0),
  (5, 1, 1),
  (5, 2, 0);
