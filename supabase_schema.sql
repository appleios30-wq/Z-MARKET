-- Create Products Table
CREATE TABLE products (
  id BIGINT PRIMARY KEY,
  name TEXT NOT NULL,
  barcode TEXT NOT NULL,
  price DECIMAL NOT NULL,
  stock INTEGER DEFAULT 0,
  category TEXT,
  sold INTEGER DEFAULT 0,
  expiry TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  image TEXT
);

-- Create Orders Table
CREATE TABLE orders (
  id BIGINT PRIMARY KEY,
  customer_name TEXT,
  customer_phone TEXT,
  items JSONB, -- Stores content of the cart
  total DECIMAL,
  status TEXT DEFAULT 'pending',
  date TEXT, -- Stored as ISO string
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create Messages Table
CREATE TABLE messages (
  id BIGINT PRIMARY KEY,
  conversation_id TEXT, -- Usually customer phone
  text TEXT,
  sender TEXT, -- 'me' (store) or 'customer'
  time TEXT,
  date TIMESTAMPTZ DEFAULT NOW(),
  read BOOLEAN DEFAULT FALSE
);

-- Create Contacts Table
CREATE TABLE contacts (
  id BIGINT PRIMARY KEY,
  name TEXT,
  phone TEXT,
  type TEXT, -- 'customer' or 'supplier'
  company TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Realtime
alter publication supabase_realtime add table products;
alter publication supabase_realtime add table orders;
alter publication supabase_realtime add table messages;
