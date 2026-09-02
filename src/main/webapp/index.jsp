<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEXUS // Dark Cyberpunk Experience</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=Syne:wght@700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-deep: #05070f;
            --bg-surface: rgba(15, 23, 42, 0.6);
            --bg-card: rgba(30, 41, 59, 0.4);
            --border-glow: rgba(56, 189, 248, 0.2);
            --border-active: #38bdf8;
            --neon-cyan: #38bdf8;
            --neon-pink: #f43f5e;
            --neon-purple: #a855f7;
            --text-main: #f8fafc;
            --text-sub: #94a3b8;
            --glass-blur: blur(20px);
            --radius-xl: 28px;
            --radius-lg: 18px;
            --radius-md: 12px;
            --transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Space Grotesk', sans-serif;
        }

        body {
            background-color: var(--bg-deep);
            color: var(--text-main);
            overflow-x: hidden;
            line-height: 1.5;
        }

        /* Ambient Background Glows */
        .ambient-glow-1 {
            position: fixed;
            top: -200px;
            left: -200px;
            width: 700px;
            height: 700px;
            background: radial-gradient(circle, rgba(168, 85, 247, 0.15) 0%, rgba(0, 0, 0, 0) 70%);
            z-index: -1;
            pointer-events: none;
        }

        .ambient-glow-2 {
            position: fixed;
            bottom: -200px;
            right: -200px;
            width: 800px;
            height: 800px;
            background: radial-gradient(circle, rgba(56, 189, 248, 0.12) 0%, rgba(0, 0, 0, 0) 70%);
            z-index: -1;
            pointer-events: none;
        }

        h1, h2, h3, .brand-text {
            font-family: 'Syne', sans-serif;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .container {
            max-width: 1320px;
            margin: 0 auto;
            padding: 0 28px;
        }

        /* Glassmorphism Floating Header */
        header {
            position: fixed;
            top: 20px;
            left: 0;
            right: 0;
            z-index: 1000;
        }

        .header-inner {
            background: var(--bg-surface);
            backdrop-filter: var(--glass-blur);
            -webkit-backdrop-filter: var(--glass-blur);
            border: 1px solid var(--border-glow);
            border-radius: 99px;
            padding: 12px 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 22px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .brand-icon {
            width: 38px;
            height: 38px;
            background: linear-gradient(135deg, var(--neon-cyan), var(--neon-purple));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #000;
            font-size: 16px;
            box-shadow: 0 0 20px rgba(56, 189, 248, 0.5);
        }

        .nav-links {
            display: flex;
            gap: 36px;
        }

        .nav-links a {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-sub);
            transition: var(--transition);
        }

        .nav-links a:hover, .nav-links a.active {
            color: var(--neon-cyan);
            text-shadow: 0 0 10px rgba(56, 189, 248, 0.5);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .glass-btn {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glow);
            color: var(--text-main);
            width: 44px;
            height: 44px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
        }

        .glass-btn:hover {
            border-color: var(--neon-cyan);
            box-shadow: 0 0 15px rgba(56, 189, 248, 0.3);
            color: var(--neon-cyan);
        }

        .cart-tag {
            position: absolute;
            top: -2px;
            right: -2px;
            background: var(--neon-pink);
            color: #fff;
            font-size: 10px;
            font-weight: 700;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 10px rgba(244, 63, 94, 0.6);
        }

        /* Hero Section */
        .hero {
            padding-top: 160px;
            padding-bottom: 80px;
        }

        .hero-grid {
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 40px;
            align-items: center;
        }

        .hero-card {
            background: var(--bg-surface);
            backdrop-filter: var(--glass-blur);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-xl);
            padding: 60px;
            position: relative;
            overflow: hidden;
        }

        .hero-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--neon-cyan), transparent);
        }

        .pill-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 16px;
            border-radius: 99px;
            background: rgba(56, 189, 248, 0.1);
            border: 1px solid rgba(56, 189, 248, 0.3);
            color: var(--neon-cyan);
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 24px;
        }

        .hero-card h1 {
            font-size: 56px;
            line-height: 1.05;
            letter-spacing: -1px;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #ffffff 30%, #94a3b8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-card p {
            color: var(--text-sub);
            font-size: 18px;
            margin-bottom: 36px;
            max-width: 480px;
        }

        .cta-group {
            display: flex;
            gap: 16px;
        }

        .btn-neon {
            padding: 16px 36px;
            border-radius: 99px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-neon-primary {
            background: var(--neon-cyan);
            color: #000;
            box-shadow: 0 0 25px rgba(56, 189, 248, 0.4);
        }

        .btn-neon-primary:hover {
            box-shadow: 0 0 35px rgba(56, 189, 248, 0.7);
            transform: translateY(-2px);
        }

        .btn-neon-secondary {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-main);
            border: 1px solid var(--border-glow);
        }

        .btn-neon-secondary:hover {
            border-color: var(--text-main);
            background: rgba(255, 255, 255, 0.1);
        }

        .hero-side-card {
            background: var(--bg-surface);
            backdrop-filter: var(--glass-blur);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-xl);
            padding: 30px;
            position: relative;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .side-img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            border-radius: var(--radius-lg);
            margin-bottom: 20px;
        }

        /* Products Section */
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
            font-size: 36px;
            letter-spacing: -0.5px;
        }

        .section-title p {
            color: var(--text-sub);
            margin-top: 6px;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
        }

        .cyber-card {
            background: var(--bg-card);
            backdrop-filter: var(--glass-blur);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 20px;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .cyber-card:hover {
            border-color: var(--neon-cyan);
            transform: translateY(-6px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6), 0 0 20px rgba(56, 189, 248, 0.2);
        }

        .img-container {
            width: 100%;
            height: 220px;
            border-radius: var(--radius-md);
            overflow: hidden;
            position: relative;
            margin-bottom: 16px;
        }

        .img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .cyber-card:hover .img-container img {
            transform: scale(1.08);
        }

        .tag {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--neon-cyan);
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 99px;
            text-transform: uppercase;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .card-body h3 {
            font-size: 18px;
            margin-bottom: 8px;
            font-family: 'Space Grotesk', sans-serif;
            font-weight: 600;
        }

        .card-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: auto;
            padding-top: 16px;
        }

        .price {
            font-size: 22px;
            font-weight: 700;
            color: var(--text-main);
        }

        .add-cart-btn {
            width: 42px;
            height: 42px;
            border-radius: var(--radius-md);
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glow);
            color: var(--text-main);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
        }

        .cyber-card:hover .add-cart-btn {
            background: var(--neon-cyan);
            color: #000;
            border-color: var(--neon-cyan);
            box-shadow: 0 0 15px rgba(56, 189, 248, 0.5);
        }

        /* Footer */
        footer {
            border-top: 1px solid var(--border-glow);
            padding: 60px 0 30px;
            margin-top: 100px;
            background: rgba(5, 7, 15, 0.8);
        }

        .footer-inner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 40px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .copyright {
            color: var(--text-sub);
            font-size: 14px;
            text-align: center;
            margin-top: 30px;
        }

        /* Responsive Layout */
        @media (max-width: 992px) {
            .hero-grid { grid-template-columns: 1fr; }
            .nav-links { display: none; }
            .hero-card h1 { font-size: 40px; }
        }
    </style>
</head>
<body>

    <div class="ambient-glow-1"></div>
    <div class="ambient-glow-2"></div>

    <!-- Floating Navigation -->
    <header>
        <div class="container">
            <div class="header-inner">
                <a href="#" class="brand">
                    <div class="brand-icon"><i class="fa-solid fa-bolt"></i></div>
                    <span class="brand-text">NEXUS</span>
                </a>

                <nav class="nav-links">
                    <a href="#" class="active">Store</a>
                    <a href="#">Drop #004</a>
                    <a href="#">Categories</a>
                    <a href="#">Vault</a>
                </nav>

                <div class="header-actions">
                    <button class="glass-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                    <button class="glass-btn">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="cart-tag">2</span>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-grid">
                <div class="hero-card">
                    <div class="pill-badge"><i class="fa-solid fa-sparkles"></i> Future Tech 2026</div>
                    <h1>Cyber-Engineered Essentials</h1>
                    <p>High-performance aesthetic hardware, modular EDC accessories, and zero-gravity acoustic gear.</p>
                    <div class="cta-group">
                        <a href="#products" class="btn-neon btn-neon-primary">Explore Drops <i class="fa-solid fa-arrow-right"></i></a>
                        <a href="#" class="btn-neon btn-neon-secondary">Learn More</a>
                    </div>
                </div>

                <div class="hero-side-card">
                    <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80" alt="Special Product" class="side-img">
                    <div>
                        <div class="pill-badge" style="color: var(--neon-pink); border-color: rgba(244,63,94,0.3); background: rgba(244,63,94,0.1);">Featured Drop</div>
                        <h3>Acoustic Pulse One</h3>
                        <p style="color: var(--text-sub); font-size: 14px; margin-top: 4px;">Ultra-wide frequency spatial audio rig.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Products Grid Section -->
    <section class="section" id="products">
        <div class="container">
            <div class="section-header">
                <div class="section-title">
                    <h2>Current Drops</h2>
                    <p>Limited quantity production run</p>
                </div>
            </div>

            <div class="products-grid">
                <!-- Card 1 -->
                <div class="cyber-card">
                    <div class="img-container">
                        <span class="tag">Audio</span>
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" alt="Headphones">
                    </div>
                    <div class="card-body">
                        <h3>Pulse-X Headphones</h3>
                        <div class="card-bottom">
                            <span class="price">$249</span>
                            <button class="add-cart-btn"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="cyber-card">
                    <div class="img-container">
                        <span class="tag">Wearable</span>
                        <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80" alt="Watch">
                    </div>
                    <div class="card-body">
                        <h3>Chronos Smart Ring v2</h3>
                        <div class="card-bottom">
                            <span class="price">$189</span>
                            <button class="add-cart-btn"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="cyber-card">
                    <div class="img-container">
                        <span class="tag">Gear</span>
                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=600&q=80" alt="Sneakers">
                    </div>
                    <div class="card-body">
                        <h3>Matrix Runners</h3>
                        <div class="card-bottom">
                            <span class="price">$150</span>
                            <button class="add-cart-btn"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Card 4 -->
                <div class="cyber-card">
                    <div class="img-container">
                        <span class="tag">EDC</span>
                        <img src="https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&w=600&q=80" alt="Bag">
                    </div>
                    <div class="card-body">
                        <h3>Modular Sling Pack</h3>
                        <div class="card-bottom">
                            <span class="price">$110</span>
                            <button class="add-cart-btn"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-inner">
                <a href="#" class="brand">
                    <div class="brand-icon"><i class="fa-solid fa-bolt"></i></div>
                    <span class="brand-text">NEXUS</span>
                </a>
                <div style="color: var(--text-sub); font-size: 14px;">Next-Gen E-Commerce Interface</div>
            </div>
            <div class="copyright">
                &copy; 2026 NEXUS PROTOCOL. All Rights Reserved.
            </div>
        </div>
    </footer>

</body>
</html>
