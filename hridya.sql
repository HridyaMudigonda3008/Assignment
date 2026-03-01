Create database hridya;
use hridya;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

-- EVENTS (general event info)
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT
);

-- EVENT INSTANCES (date/time specific + capacity)
CREATE TABLE event_instances (
    instance_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    event_date DATETIME NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- ORDERS (one user can have many orders)
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- TICKETS (each ticket belongs to an order + event instance)
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    instance_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (instance_id) REFERENCES event_instances(instance_id)
);

-- PAYMENTS
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status ENUM('PENDING','PAID','FAILED') NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- -------------------
-- SAMPLE DATA
-- -------------------

INSERT INTO users (name, email) VALUES
('Alice', 'alice@email.com'),
('Bob', 'bob@email.com');

INSERT INTO events (title, description) VALUES
('Tech Conference', 'Annual tech event'),
('Music Concert', 'Live music show');

INSERT INTO event_instances (event_id, event_date, capacity) VALUES
(1, '2026-03-10 10:00:00', 100),
(2, '2026-03-15 19:00:00', 50);

INSERT INTO orders (user_id) VALUES
(1),
(2);

INSERT INTO tickets (order_id, instance_id, price) VALUES
(1, 1, 50.00),
(1, 1, 50.00),
(2, 2, 75.00);

INSERT INTO payments (order_id, amount, status) VALUES
(1, 100.00, 'PAID'),
(2, 75.00, 'PAID');

INSERT INTO users (name, email) VALUES
('Aarav Sharma','aarav.sharma@mail.com'),
('Riya Patel','riya.patel@mail.com'),
('Aditya Verma','aditya.verma@mail.com'),
('Sneha Iyer','sneha.iyer@mail.com'),
('Kunal Mehta','kunal.mehta@mail.com'),
('Pooja Singh','pooja.singh@mail.com'),
('Rohit Gupta','rohit.gupta@mail.com'),
('Ananya Rao','ananya.rao@mail.com'),
('Vikram Malhotra','vikram.m@mail.com'),
('Neha Kapoor','neha.kapoor@mail.com'),
('Siddharth Jain','siddharth.jain@mail.com'),
('Priya Nair','priya.nair@mail.com'),
('Arjun Khanna','arjun.khanna@mail.com'),
('Kavya Reddy','kavya.reddy@mail.com'),
('Manish Bansal','manish.bansal@mail.com'),
('Ishita Chawla','ishita.chawla@mail.com'),
('Amit Aggarwal','amit.aggarwal@mail.com'),
('Nidhi Saxena','nidhi.saxena@mail.com'),
('Rahul Tripathi','rahul.tripathi@mail.com'),
('Simran Kaur','simran.kaur@mail.com'),
('Varun Arora','varun.arora@mail.com'),
('Meera Joshi','meera.joshi@mail.com'),
('Deepak Yadav','deepak.yadav@mail.com'),
('Shreya Banerjee','shreya.b@mail.com'),
('Akash Mishra','akash.mishra@mail.com'),
('Tanvi Kulkarni','tanvi.k@mail.com'),
('Mohit Sethi','mohit.sethi@mail.com'),
('Pallavi Deshmukh','pallavi.d@mail.com'),
('Rakesh Tiwari','rakesh.t@mail.com'),
('Alka Menon','alka.menon@mail.com');

INSERT INTO events (title, description) VALUES
('Tech Innovators Summit','Technology and innovation conference'),
('Bollywood Night Live','Live Bollywood music concert'),
('Startup Pitch Day','Startup founders pitching ideas'),
('AI & ML Bootcamp','Hands-on AI training'),
('Gaming Arena Expo','Gaming and esports event'),
('Modern Art Gallery','Exhibition of modern artworks'),
('Street Food Carnival','Multi-city food festival'),
('Corporate Leadership Forum','Business leadership talks'),
('Full Stack Coding Bootcamp','Intensive coding program'),
('UX/UI Design Conference','Design thinking and UX');

INSERT INTO event_instances (event_id, event_date, capacity) VALUES
(1,'2026-03-01 10:00',120),(1,'2026-03-02 10:00',120),(1,'2026-03-03 10:00',120),
(2,'2026-03-05 19:00',80),(2,'2026-03-06 19:00',80),(2,'2026-03-07 19:00',80),
(3,'2026-03-10 18:00',60),(3,'2026-03-11 18:00',60),(3,'2026-03-12 18:00',60),
(4,'2026-03-15 09:00',40),(4,'2026-03-16 09:00',40),(4,'2026-03-17 09:00',40),
(5,'2026-03-20 12:00',150),(5,'2026-03-21 12:00',150),(5,'2026-03-22 12:00',150),
(6,'2026-03-25 11:00',50),(6,'2026-03-26 11:00',50),(6,'2026-03-27 11:00',50),
(7,'2026-03-28 16:00',200),(7,'2026-03-29 16:00',200),(7,'2026-03-30 16:00',200),
(8,'2026-04-01 10:00',90),(8,'2026-04-02 10:00',90),(8,'2026-04-03 10:00',90),
(9,'2026-04-05 09:00',30),(9,'2026-04-06 09:00',30),(9,'2026-04-07 09:00',30),
(10,'2026-04-10 10:00',120),(10,'2026-04-11 10:00',120),(10,'2026-04-12 10:00',120);

INSERT INTO orders (user_id) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);

INSERT INTO tickets (order_id, instance_id, price) VALUES
(1,1,120),(2,2,120),(3,3,120),
(4,4,800),(5,5,800),(6,6,800),
(7,7,500),(8,8,500),(9,9,500),
(10,10,300),(11,11,300),(12,12,300),
(13,13,600),(14,14,600),(15,15,600),
(16,16,450),(17,17,450),(18,18,450),
(19,19,200),(20,20,200),(21,21,200),
(22,22,900),(23,23,900),(24,24,900),
(25,25,250),(26,26,250),(27,27,250),
(28,28,700),(29,29,700),(30,30,700);

INSERT INTO payments (order_id, amount, status) VALUES
(1,120,'PAID'),(2,120,'PAID'),(3,120,'PAID'),
(4,800,'PAID'),(5,800,'PAID'),(6,800,'PAID'),
(7,500,'PAID'),(8,500,'PAID'),(9,500,'PAID'),
(10,300,'PAID'),(11,300,'PAID'),(12,300,'PAID'),
(13,600,'PAID'),(14,600,'PAID'),(15,600,'PAID'),
(16,450,'PAID'),(17,450,'PAID'),(18,450,'PAID'),
(19,200,'PAID'),(20,200,'PAID'),(21,200,'PAID'),
(22,900,'PAID'),(23,900,'PAID'),(24,900,'PAID'),
(25,250,'PAID'),(26,250,'PAID'),(27,250,'PAID'),
(28,700,'PAID'),(29,700,'PAID'),(30,700,'PAID');

SELECT 
    ei.instance_id,
    e.title AS event_name,
    ei.event_date,
    ei.capacity - COUNT(t.ticket_id) AS available_seats
FROM event_instances ei
JOIN events e 
    ON ei.event_id = e.event_id
LEFT JOIN tickets t 
    ON ei.instance_id = t.instance_id
WHERE ei.instance_id = 1
GROUP BY 
    ei.instance_id,
    ei.capacity,
    e.title,
    ei.event_date;
    
    SELECT 
    u.name AS user_name,
    e.title AS event_name,
    ei.event_date,
    t.ticket_id,
    t.price
FROM users u
JOIN orders o 
    ON u.user_id = o.user_id
JOIN tickets t 
    ON o.order_id = t.order_id
JOIN event_instances ei 
    ON t.instance_id = ei.instance_id
JOIN events e 
    ON ei.event_id = e.event_id
WHERE u.user_id = 1
ORDER BY ei.event_date;

SELECT 
    e.title AS event_name,
    SUM(t.price) AS total_revenue
FROM events e
JOIN event_instances ei 
    ON e.event_id = ei.event_id
JOIN tickets t 
    ON ei.instance_id = t.instance_id
GROUP BY 
    e.event_id,
    e.title
ORDER BY total_revenue DESC;