<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aura Market - Modern E-Commerce</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --bg-light: #f8fafc;
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            padding-bottom: 3rem;
        }

        /* Navigation Header */
        header {
            background-color: #ffffff;
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            text-decoration: none;
        }

        .cart-trigger {
            position: relative;
            background: none;
            border: none;
            font-size: 1.25rem;
            cursor: pointer;
            padding: 0.5rem;
        }

        .cart-badge {
            position: absolute;
            top: 0;
            right: 0;
            background-color: var(--primary);
            color: white;
            font-size: 0.75rem;
            font-weight: bold;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Layout Container */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* Category Filter Buttons */
        .filter-bar {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            overflow-x: auto;
            padding-bottom: 0.5rem;
        }

        .filter-btn {
            background-color: #ffffff;
            border: 1px solid var(--border);
            padding: 0.5rem 1.25rem;
            border-radius: 20px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.2s;
        }

        .filter-btn.active, .filter-btn:hover {
            background-color: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 2rem;
        }

        .product-card {
            background-color: #ffffff;
            border: 1px solid var(--border);
            border-radius: 12px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .product-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-info {
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .product-category {
            font-size: 0.75rem;
            text-transform: uppercase;
            color: var(--text-muted);
            letter-spacing: 0.5px;
            margin-bottom: 0.25rem;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .product-bottom {
            margin-top: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 1rem;
        }

        .product-price {
            font-size: 1.2rem;
            font-weight: 700;
        }

        .btn-add {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-add:hover {
            background-color: var(--primary-dark);
        }

        /* Slide-over Cart Drawer */
        .cart-drawer {
            position: fixed;
            top: 0;
            right: -400px;
            width: 380px;
            height: 100%;
            background-color: #ffffff;
            box-shadow: -5px 0 25px rgba(0,0,0,0.15);
            transition: right 0.3s ease;
            z-index: 200;
            display: flex;
            flex-direction: column;
        }

        .cart-drawer.open {
            right: 0;
        }

        .cart-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--border);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .close-cart {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
        }

        .cart-items {
            flex-grow: 1;
            overflow-y: auto;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border);
        }

        .cart-footer {
            padding: 1.5rem;
            border-top: 1px solid var(--border);
            background-color: var(--bg-light);
        }

        .cart-total {
            display: flex;
            justify-content: space-between;
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .btn-checkout {
            width: 100%;
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.8rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
        }

        @media (max-width: 480px) {
            .cart-drawer { width: 100%; }
        }
    </style>
</head>
<body>

    <!-- Header / Nav -->
    <header>
        <div class="nav-container">
            <a href="#" class="logo">Aura.</a>
            <button class="cart-trigger" id="cartBtn">
                🛒
                <span class="cart-badge" id="cartCount">0</span>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container">
        <!-- Category Filter -->
        <div class="filter-bar">
            <button class="filter-btn active" onclick="filterProducts('all')">All Products</button>
            <button class="filter-btn" onclick="filterProducts('electronics')">Electronics</button>
            <button class="filter-btn" onclick="filterProducts('lifestyle')">Lifestyle</button>
            <button class="filter-btn" onclick="filterProducts('apparel')">Apparel</button>
        </div>

        <!-- Catalog Grid -->
        <div class="product-grid" id="productGrid">
            <!-- Dynamic Javascript Rendering -->
        </div>
    </main>

    <!-- Cart Drawer Sidebar -->
    <div class="cart-drawer" id="cartDrawer">
        <div class="cart-header">
            <h3>Your Cart</h3>
            <button class="close-cart" id="closeCart">&times;</button>
        </div>
        <div class="cart-items" id="cartItems">
            <p style="color: var(--text-muted); text-align: center;">Your cart is currently empty.</p>
        </div>
        <div class="cart-footer">
            <div class="cart-total">
                <span>Total:</span>
                <span id="cartTotal">$0.00</span>
            </div>
            <button class="btn-checkout" onclick="alert('Proceeding to checkout!')">Checkout</button>
        </div>
    </div>

    <script>
        // Catalog Data
        const products = [
            { id: 1, title: 'Wireless Headphones', category: 'electronics', price: 129.99, image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=500&q=80' },
            { id: 2, title: 'Minimalist Watch', category: 'lifestyle', price: 89.00, image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=500&q=80' },
            { id: 3, title: 'Ergonomic Desk Lamp', category: 'lifestyle', price: 45.50, image: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?auto=format&fit=crop&w=500&q=80' },
            { id: 4, title: 'Cotton Hoodie', category: 'apparel', price: 59.99, image: 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&w=500&q=80' },
            { id: 5, title: 'Mechanical Keyboard', category: 'electronics', price: 109.00, image: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=500&q=80' },
            { id: 6, title: 'Leather Backpack', category: 'apparel', price: 140.00, image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=500&q=80' }
        ];

        let cart = [];

        // DOM Elements
        const productGrid = document.getElementById('productGrid');
        const cartDrawer = document.getElementById('cartDrawer');
        const cartBtn = document.getElementById('cartBtn');
        const closeCart = document.getElementById('closeCart');
        const cartItemsContainer = document.getElementById('cartItems');
        const cartCount = document.getElementById('cartCount');
        const cartTotal = document.getElementById('cartTotal');

        // Render Products to Grid
        function renderProducts(items) {
            productGrid.innerHTML = items.map(product => `
                <div class="product-card">
                    <img src="${product.image}" alt="${product.title}" class="product-img">
                    <div class="product-info">
                        <span class="product-category">${product.category}</span>
                        <h3 class="product-title">${product.title}</h3>
                        <div class="product-bottom">
                            <span class="product-price">$${product.price.toFixed(2)}</span>
                            <button class="btn-add" onclick="addToCart(${product.id})">Add to Cart</button>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // Filter Products
        function filterProducts(category) {
            document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');

            if (category === 'all') {
                renderProducts(products);
            } else {
                renderProducts(products.filter(p => p.category === category));
            }
        }

        // Add Product to Cart
        function addToCart(productId) {
            const product = products.find(p => p.id === productId);
            const existing = cart.find(item => item.id === productId);

            if (existing) {
                existing.quantity += 1;
            } else {
                cart.push({ ...product, quantity: 1 });
            }

            updateCartUI();
            cartDrawer.classList.add('open');
        }

        // Update Cart UI
        function updateCartUI() {
            // Update total count badge
            const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
            cartCount.innerText = totalItems;

            // Render Cart Items
            if (cart.length === 0) {
                cartItemsContainer.innerHTML = '<p style="color: var(--text-muted); text-align: center;">Your cart is currently empty.</p>';
            } else {
                cartItemsContainer.innerHTML = cart.map(item => `
                    <div class="cart-item">
                        <div>
                            <strong>${item.title}</strong>
                            <div style="color: var(--text-muted); font-size: 0.85rem;">
                                $${item.price.toFixed(2)} x ${item.quantity}
                            </div>
                        </div>
                        <div>
                            <strong>$${(item.price * item.quantity).toFixed(2)}</strong>
                        </div>
                    </div>
                `).join('');
            }

            // Calculate and display total
            const totalSum = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            cartTotal.innerText = `$${totalSum.toFixed(2)}`;
        }

        // Cart Drawer Toggles
        cartBtn.addEventListener('click', () => cartDrawer.classList.add('open'));
        closeCart.addEventListener('click', () => cartDrawer.classList.remove('open'));

        // Initial Load
        renderProducts(products);
    </script>
</body>
</html>
