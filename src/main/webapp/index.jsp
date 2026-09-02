<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexusShop — Premium Minimalist Store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-main: #f8f9fa;
            --bg-card: #ffffff;
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --accent: #f59e0b;
            --border-light: #e2e8f0;
            --shadow-sm: 0 4px 6px -1px rgba(0, 0, 0, 0.03), 0 2px 4px -2px rgba(0, 0, 0, 0.03);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.03);
            --radius-lg: 24px;
            --radius-md: 16px;
            --radius-sm: 10px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            background-color: var(--bg-main);
            color: var(--text-dark);
            line-height: 1.6;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
        }

        /* Glassmorphism Sticky Header */
        header {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            border-bottom: 1px solid var(--border-light);
            transition: var(--transition);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 80px;
            gap: 24px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 24px;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .brand i {
            color: var(--primary);
            font-size: 26px;
        }

        .brand .accent {
            color: var(--primary);
        }

        .main-nav ul {
            display: flex;
            gap: 32px;
        }

        .main-nav a {
            font-size: 15px;
            font-weight: 500;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .main-nav a:hover, .main-nav a.active {
            color: var(--primary);
        }

        .search-wrap {
            position: relative;
            flex-grow: 1;
            max-width: 360px;
        }

        .search-wrap input {
            width: 100%;
            padding: 12px 20px 12px 48px;
            border-radius: 99px;
            border: 1px solid var(--border-light);
            background: #f1f5f9;
            font-size: 14px;
            outline: none;
            transition: var(--transition);
        }

        .search-wrap input:focus {
            background: #fff;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .search-wrap i {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .icon-btn {
            position: relative;
            background: transparent;
            border: none;
            width: 44px;
            height: 44px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: var(--text-dark);
            cursor: pointer;
            transition: var(--transition);
        }

        .icon-btn:hover {
            background: #f1f5f9;
            color: var(--primary);
        }

        .cart-count {
            position: absolute;
            top: 4px;
            right: 4px;
            background: var(--primary);
            color: white;
            font-size: 11px;
            font-weight: 700;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Hero Modern Section */
        .hero {
            padding: 40px 0 80px;
        }

        .hero-banner {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            border-radius: var(--radius-lg);
            padding: 80px 60px;
            color: white;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-lg);
        }

        .hero-banner::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(37,99,235,0.3) 0%, rgba(255,255,255,0) 70%);
            border-radius: 50%;
        }

        .hero-content {
            max-width: 560px;
            position: relative;
            z-index: 2;
        }

        .badge {
            display: inline-block;
            padding: 6px 14px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 99px;
            font-size: 13px;
            font-weight: 600;
            color: #93c5fd;
            margin-bottom: 20px;
        }

        .hero-content h1 {
            font-size: 52px;
            font-weight: 700;
            line-height: 1.15;
            letter-spacing: -1px;
            margin-bottom: 20px;
        }

        .hero-content p {
            font-size: 18px;
            color: #94a3b8;
            margin-bottom: 32px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 28px;
            border-radius: 99px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            border: none;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            box-shadow: 0 10px 20px -5px rgba(37, 99, 235, 0.4);
        }

        .btn-primary:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .btn-ghost {
            background: transparent;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-left: 12px;
        }

        .btn-ghost:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        /* Section Layouts */
        .section {
            padding: 60px 0;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 40px;
        }

        .section-title h2 {
            font-size: 32px;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .section-title p {
            color: var(--text-muted);
            margin-top: 4px;
        }

        .view-all {
            color: var(--primary);
            font-weight: 600;
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .view-all:hover {
            gap: 10px;
        }

        /* Category Grid */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .cat-card {
            background: var(--bg-card);
            border-radius: var(--radius-md);
            padding: 24px;
            text-align: center;
            border: 1px solid var(--border-light);
            transition: var(--transition);
            cursor: pointer;
        }

        .cat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
            border-color: transparent;
        }

        .cat-card i {
            font-size: 28px;
            color: var(--primary);
            background: #eff6ff;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
        }

        .cat-card h4 {
            font-size: 16px;
            font-weight: 600;
        }

        .cat-card span {
            font-size: 13px;
            color: var(--text-muted);
        }

        /* Product Cards Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
            gap: 28px;
        }

        .product-card {
            background: var(--bg-card);
            border-radius: var(--radius-md);
            border: 1px solid var(--border-light);
            overflow: hidden;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-lg);
        }

        .img-wrap {
            position: relative;
            background: #f8fafc;
            height: 260px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .product-card:hover .img-wrap img {
            transform: scale(1.05);
        }

        .wish-btn {
            position: absolute;
            top: 16px;
            right: 16px;
            background: white;
            border: none;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: var(--shadow-sm);
            color: var(--text-muted);
            transition: var(--transition);
        }

        .wish-btn:hover {
            color: #ef4444;
            transform: scale(1.1);
        }

        .product-card .body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .category-tag {
            font-size: 12px;
            text-transform: uppercase;
            font-weight: 700;
            color: var(--primary);
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .product-card h5 {
            font-size: 17px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .rating {
            display: flex;
            align-items: center;
            gap: 4px;
            color: var(--accent);
            font-size: 13px;
            margin-bottom: 16px;
        }

        .price-row {
            display: flex;
            align-items: baseline;
            gap: 10px;
            margin-top: auto;
        }

        .price {
            font-size: 20px;
            font-weight: 700;
        }

        .old-price {
            font-size: 14px;
            color: var(--text-muted);
            text-decoration: line-through;
        }

        .add-btn {
            width: 100%;
            padding: 12px;
            margin-top: 16px;
            background: #f1f5f9;
            color: var(--text-dark);
            border: none;
            border-radius: var(--radius-sm);
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }

        .product-card:hover .add-btn {
            background: var(--primary);
            color: white;
        }

        /* Footer */
        footer {
            background: #0f172a;
            color: #94a3b8;
            padding: 80px 0 30px;
            margin-top: 80px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr repeat(3, 1fr);
            gap: 40px;
            margin-bottom: 60px;
        }

        .footer-grid h5 {
            color: white;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .footer-grid ul li {
            margin-bottom: 12px;
        }

        .footer-grid ul a:hover {
            color: white;
        }

        .footer-bottom {
            border-top: 1px solid #1e293b;
            padding-top: 30px;
            text-align: center;
            font-size: 14px;
        }

        /* Responsive Breakpoints */
        @media (max-width: 992px) {
            .hero-banner h1 { font-size: 40px; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
            .main-nav { display: none; }
        }

        @media (max-width: 640px) {
            .hero-banner { padding: 40px 24px; }
            .products-grid { grid-template-columns: 1fr; }
            .footer-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <header>
        <div class="container">
            <div class="header-inner">
                <a href="#" class="brand">
                    <i class="fa-solid fa-bolt-lightning"></i>
                    <span>Nexus<span class="accent">Shop</span></span>
                </a>

                <nav class="main-nav">
                    <ul>
                        <li><a href="#" class="active">Home</a></li>
                        <li><a href="#categories">Categories</a></li>
                        <li><a href="#products">Trending</a></li>
                        <li><a href="#deals">Deals</a></li>
                    </ul>
                </nav>

                <div class="search-wrap">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" placeholder="Search modern essentials...">
                </div>

                <div class="header-actions">
                    <button class="icon-btn" aria-label="Wishlist">
                        <i class="fa-regular fa-heart"></i>
                    </button>
                    <button class="icon-btn" aria-label="Cart">
                        <i class="fa-solid fa-bag-shopping"></i>
                        <span class="cart-count">3</span>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <div class="hero-banner">
                <div class="hero-content">
                    <span class="badge">Next-Gen Essentials</span>
                    <h1>Designed for Better Everyday Living</h1>
                    <p>Experience a carefully curated selection of modern lifestyle electronics, high-grade audio, and minimal home gear.</p>
                    <div>
                        <a href="#products" class="btn btn-primary">Shop Collection <i class="fa-solid fa-arrow-right"></i></a>
                        <a href="#deals" class="btn btn-ghost">View Offers</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="categories">
        <div class="container">
            <div class="section-header">
                <div class="section-title">
                    <h2>Explore Categories</h2>
                    <p>Find what you're looking for by browsing top collections</p>
                </div>
                <a href="#" class="view-all">View All <i class="fa-solid fa-chevron-right"></i></a>
            </div>

            <div class="categories-grid">
                <div class="cat-card">
                    <i class="fa-solid fa-laptop"></i>
                    <h4>Electronics</h4>
                    <span>120+ Items</span>
                </div>
                <div class="cat-card">
                    <i class="fa-solid fa-headphones"></i>
                    <h4>Audio</h4>
                    <span>85+ Items</span>
                </div>
                <div class="cat-card">
                    <i class="fa-solid fa-clock"></i>
                    <h4>Wearables</h4>
                    <span>60+ Items</span>
                </div>
                <div class="cat-card">
                    <i class="fa-solid fa-couch"></i>
                    <h4>Home Decor</h4>
                    <span>95+ Items</span>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="products">
        <div class="container">
            <div class="section-header">
                <div class="section-title">
                    <h2>Trending Products</h2>
                    <p>Our top-rated products based on customer reviews</p>
                </div>
                <a href="#" class="view-all">Browse Catalog <i class="fa-solid fa-chevron-right"></i></a>
            </div>

            <div class="products-grid">
                <div class="product-card">
                    <div class="img-wrap">
                        <button class="wish-btn" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" alt="Headphones">
                    </div>
                    <div class="body">
                        <span class="category-tag">Audio</span>
                        <h5>Studio Wireless Headphones</h5>
                        <div class="rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                            <span>(4.8)</span>
                        </div>
                        <div class="price-row">
                            <span class="price">$199.99</span>
                            <span class="old-price">$249.99</span>
                        </div>
                        <button class="add-btn"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                    </div>
                </div>

                <div class="product-card">
                    <div class="img-wrap">
                        <button class="wish-btn" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                        <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80" alt="Smart Watch">
                    </div>
                    <div class="body">
                        <span class="category-tag">Wearables</span>
                        <h5>Minimalist Smart Watch</h5>
                        <div class="rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <span>(5.0)</span>
                        </div>
                        <div class="price-row">
                            <span class="price">$149.00</span>
                        </div>
                        <button class="add-btn"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                    </div>
                </div>

                <div class="product-card">
                    <div class="img-wrap">
                        <button class="wish-btn" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=600&q=80" alt="Sneakers">
                    </div>
                    <div class="body">
                        <span class="category-tag">Footwear</span>
                        <h5>Pro Performance Sneakers</h5>
                        <div class="rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <span>(4.2)</span>
                        </div>
                        <div class="price-row">
                            <span class="price">$129.50</span>
                        </div>
                        <button class="add-btn"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                    </div>
                </div>

                <div class="product-card">
                    <div class="img-wrap">
                        <button class="wish-btn" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                        <img src="https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&w=600&q=80" alt="Leather Bag">
                    </div>
                    <div class="body">
                        <span class="category-tag">Accessories</span>
                        <h5>Handcrafted Leather Tote</h5>
                        <div class="rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <span>(4.9)</span>
                        </div>
                        <div class="price-row">
                            <span class="price">$89.99</span>
                        </div>
                        <button class="add-btn"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="footer-grid">
                <div>
                    <a href="#" class="brand" style="color: white; margin-bottom: 16px;">
                        <i class="fa-solid fa-bolt-lightning"></i>
                        <span>Nexus<span class="accent">Shop</span></span>
                    </a>
                    <p>Elevating daily lifestyle through clean, functional, and modern product collections.</p>
                </div>
                <div>
                    <h5>Shop</h5>
                    <ul>
                        <li><a href="#">Electronics</a></li>
                        <li><a href="#">Audio Gear</a></li>
                        <li><a href="#">Wearables</a></li>
                    </ul>
                </div>
                <div>
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Track Order</a></li>
                        <li><a href="#">Returns & Exchanges</a></li>
                    </ul>
                </div>
                <div>
                    <h5>Company</h5>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 NexusShop Inc. All rights reserved.</p>
            </div>
        </div>
    </footer>

</body>
</html>
