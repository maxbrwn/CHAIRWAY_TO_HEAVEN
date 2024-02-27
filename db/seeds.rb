User.destroy_all
Furniture.destroy_all

User.create(
  email: "user1@example.com",
  password: "123456",
  first_name: "John",
  last_name: "Doe"
)
User.create(
  email: "user2@example.com",
  password: "123456",
  first_name: "Jane",
  last_name: "Smith"
)
User.create!(
  email: "user3@example.com",
  password: "123456",
  first_name: "Michael",
  last_name: "Johnson"
)

Furniture.create(
  title: "Comfy Sofa",
  address: "123 Main St, Cityville",
  description: "A cozy sofa perfect for lounging.",
  condition: "Good condition, minor wear",
  availability: true,
  category: "Sofa",
  price: 300.00,
  user_id: User.first.id
)

Furniture.create(
  title: "Vintage Coffee Table",
  address: "456 Elm St, Townsville",
  description: "Beautiful vintage coffee table with intricate design.",
  condition: "Excellent condition",
  availability: true,
  category: "Coffee Table",
  price: 150.00,
  user_id: User.second.id
)

Furniture.create(
  title: "Stylish Desk",
  address: "789 Oak St, Villageton",
  description: "Modern desk with plenty of storage.",
  condition: "Like new",
  availability: true,
  category: "Desk",
  price: 250.00,
  user_id: User.third.id
)
