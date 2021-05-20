DROP TABLE IF EXISTS thread_contact;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS contact;
DROP TABLE IF EXISTS thread;
DROP TABLE IF EXISTS thread_type;

CREATE TABLE IF NOT EXISTS contact (
  contact_id TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  initials TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS thread_type (thread_type_id serial PRIMARY KEY, "name" TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS thread (
  thread_id serial PRIMARY KEY,
  title TEXT NOT NULL,
  subtitle TEXT NULL,
  thread_type_id INT NOT NULL REFERENCES thread_type(thread_type_id) ON DELETE CASCADE,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS message (
  message_id serial PRIMARY KEY,
  "content" TEXT NOT NULL,
  thread_id INTEGER NOT NULL REFERENCES thread(thread_id) ON DELETE CASCADE,
  contact_id TEXT NOT NULL REFERENCES contact(contact_id) ON DELETE CASCADE,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS thread_contact (
  thread_id INTEGER NOT NULL REFERENCES thread(thread_id) ON DELETE CASCADE,
  contact_id TEXT NOT NULL REFERENCES contact(contact_id) ON DELETE CASCADE,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (thread_id, contact_id)
);

INSERT INTO
  thread_type ("name")
VALUES
  ('basic');

INSERT INTO
  contact (contact_id, "name", initials, created_at, updated_at)
VALUES
  (
    '609e7d3a734e3f89952df601',
    'André Peixoto',
    'AP',
    NOW(),
    NOW()
  ),
  (
    '609d9472c4c0441250191dd5',
    'Anton Chainikov',
    'AC',
    NOW(),
    NOW()
  ),
  (
    '609d9480260f8f9c8700448b',
    'Guilherme Maia',
    'GM',
    NOW(),
    NOW()
  ),
  (
    '609d948d0b6c656d5b143e19',
    'Ilya Eremin',
    'IE',
    NOW(),
    NOW()
  ),
  (
    '609d949373c76ef6c7e131e9',
    'Owen McGettrick',
    'OM',
    NOW(),
    NOW()
  ),
  (
    '609d949ab74e4cb037d3878e',
    'Rodrigo Pecci Acorse',
    'RA',
    NOW(),
    NOW()
  ),
  (
    '609d94a0b0ae8b03f49fb3fc',
    'Thiago Figueiredo',
    'TF',
    NOW(),
    NOW()
  );

INSERT INTO
  thread (
    thread_id,
    title,
    subtitle,
    thread_type_id,
    created_at,
    updated_at
  )
VALUES
  (1, 'Hello, World', 'No subtitle', 1, NOW(), NOW()),
  (2, 'A second thread', NULL, 1, NOW(), NOW()),
  (
    3,
    'Testing messages',
    'Using Hasura',
    1,
    NOW(),
    NOW()
  ),
  (4, 'What about authorisation', '', 1, NOW(), NOW()),
  (
    5,
    'TypeScript',
    'TypeScript everywhere!',
    1,
    NOW(),
    NOW()
  );

INSERT INTO
  thread_contact (thread_id, contact_id, created_at, updated_at)
VALUES
  (1, '609d9472c4c0441250191dd5', NOW(), NOW()),
  (1, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (1, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (2, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (2, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (3, '609d949ab74e4cb037d3878e', NOW(), NOW()),
  (3, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (4, '609e7d3a734e3f89952df601', NOW(), NOW()),
  (4, '609d9472c4c0441250191dd5', NOW(), NOW()),
  (4, '609d9480260f8f9c8700448b', NOW(), NOW()),
  (4, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (4, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (4, '609d949ab74e4cb037d3878e', NOW(), NOW());

INSERT INTO
  message (message_id, content, thread_id, contact_id, created_at, updated_at)
VALUES
  (1, 'Proin a feugiat nulla, nec vestibulum metus.', 4, '609d949ab74e4cb037d3878e', NOW(), NOW()),
  (2, 'Ut vel mi in nulla ultricies congue.', 3, '609d949ab74e4cb037d3878e', NOW(), NOW()),
  (3, 'Etiam ultrices dictum pulvinar. Sed ut sollicitudin.', 2, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (4, 'Maecenas sagittis egestas justo, eget aliquam augue.', 1, '609d9472c4c0441250191dd5', NOW(), NOW()),
  (5, 'Nulla tempus, massa ut malesuada laoreet, sem.', 2, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (6, 'Praesent dictum felis nec posuere hendrerit. Pellentesque.', 3, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (7, 'Nam augue ex, vestibulum vitae diam vitae.', 2, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (8, 'Vestibulum eu libero lorem. In commodo hendrerit.', 2, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (9, 'Integer venenatis lectus vitae ullamcorper tempor. Nullam.', 4, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (10, 'Suspendisse semper nulla id magna facilisis facilisis.', 1, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (11, 'Cras tincidunt neque enim. Nullam dictum nunc.', 3, '609d949ab74e4cb037d3878e', NOW(), NOW()),
  (12, 'Suspendisse eu enim quis justo accumsan hendrerit.', 1, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (13, 'Sed lobortis ultrices placerat. Proin pellentesque bibendum.', 2, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (14, 'Mauris sagittis elit non vulputate venenatis. Suspendisse.', 3, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (15, 'Curabitur ac rhoncus nulla. Praesent semper vulputate.', 2, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (16, 'Etiam eget tempor libero, vitae pellentesque leo.', 2, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (17, 'Nulla malesuada nisl est, ut tincidunt est.', 3, '609d949ab74e4cb037d3878e', NOW(), NOW()),
  (18, 'Nunc vehicula eros id nulla ultricies, et.', 1, '609d9472c4c0441250191dd5', NOW(), NOW()),
  (19, 'Mauris facilisis ex eu justo interdum, in.', 3, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (20, 'Curabitur feugiat id lorem ultrices faucibus. Duis.', 2, '609d949373c76ef6c7e131e9', NOW(), NOW()),
  (21, 'Morbi ut odio non nisi pellentesque laoreet.', 3, '609d949ab74e4cb037d3878e', NOW(), NOW()),
  (22, 'Duis semper lacinia mi sit amet venenatis.', 4, '609d948d0b6c656d5b143e19', NOW(), NOW()),
  (23, 'Pellentesque in urna augue. Morbi eleifend metus.', 1, '609d948d0b6c656d5b143e19', NOW(), NOW());
