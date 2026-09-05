<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StreamFlix - Watch TV Shows & Movies</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #141414;
            color: #ffffff;
            overflow-x: hidden;
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: linear-gradient(to bottom, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 100%);
            z-index: 100;
            transition: background-color 0.4s ease;
        }

        .navbar-brand {
            color: #e50914;
            font-size: 1.8rem;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 20px;
        }

        .nav-links a {
            color: #e5e5e5;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #b3b3b3;
        }

        /* Hero Featured Section */
        .hero {
            position: relative;
            height: 80vh;
            background: linear-gradient(to top, #141414 5%, transparent 40%),
                        linear-gradient(to right, rgba(0,0,0,0.8) 20%, transparent 60%),
                        url('https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?auto=format&fit=crop&w=1600&q=80') center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 50px;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            max-width: 600px;
            margin-bottom: 15px;
        }

        .hero-description {
            font-size: 1.1rem;
            max-width: 500px;
            line-height: 1.4;
            margin-bottom: 25px;
            color: #d2d2d2;
        }

        .hero-buttons {
            display: flex;
            gap: 12px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 24px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .btn-play {
            background-color: #ffffff;
            color: #000000;
        }

        .btn-info {
            background-color: rgba(109, 109, 110, 0.7);
            color: #ffffff;
        }

        .btn:hover {
            opacity: 0.8;
        }

        /* Media Rows */
        .content-section {
            padding: 20px 50px;
            margin-top: -80px;
            position: relative;
            z-index: 10;
        }

        .row-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 12px;
            color: #e5e5e5;
        }

        .row-posters {
            display: flex;
            gap: 10px;
            overflow-x: auto;
            padding: 10px 0;
            scroll-behavior: smooth;
        }

        .row-posters::-webkit-scrollbar {
            display: none;
        }

        .poster-card {
            min-width: 200px;
            height: 120px;
            background-size: cover;
            background-position: center;
            border-radius: 4px;
            transition: transform 0.3s ease, filter 0.3s;
            cursor: pointer;
            flex-shrink: 0;
        }

        .poster-card:hover {
            transform: scale(1.08);
            filter: brightness(1.2);
        }

        /* Responsive Breakpoints */
        @media (max-width: 768px) {
            .navbar { padding: 15px 20px; }
            .hero { padding: 0 20px; height: 60vh; }
            .hero-title { font-size: 2rem; }
            .hero-description { font-size: 0.9rem; }
            .content-section { padding: 20px; margin-top: 0; }
        }
    </style>
</head>
<body>

    <!-- Header Navigation -->
    <header class="navbar">
        <div class="navbar-brand">StreamFlix</div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">TV Shows</a></li>
            <li><a href="#">Movies</a></li>
            <li><a href="#">New & Popular</a></li>
            <li><a href="#">My List</a></li>
        </ul>
    </header>

    <!-- Main Hero Banner -->
    <section class="hero">
        <h1 class="hero-title">Cyber Chronicles</h1>
        <p class="hero-description">
            When a rogue synthetic intelligence threatens the grid, a lone operator must navigate the neon underbelly of Neo-Tokyo to uncover a corporate conspiracy.
        </p>
        <div class="hero-buttons">
            <button class="btn btn-play" onclick="alert('Playing trailer...')">► Play</button>
            <button class="btn btn-info" onclick="alert('Opening show details...')">ⓘ More Info</button>
        </div>
    </section>

    <!-- Content Row -->
    <section class="content-section">
        <h2 class="row-title">Trending Now</h2>
        <div class="row-posters">
            <div class="poster-card" style="background-image: url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=400&q=80');"></div>
            <div class="poster-card" style="background-image: url('https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=400&q=80');"></div>
            <div class="poster-card" style="background-image: url('https://images.unsplash.com/photo-1578632767115-351597cf2477?auto=format&fit=crop&w=400&q=80');"></div>
            <div class="poster-card" style="background-image: url('https://images.unsplash.com/photo-1485846234645-a62644f84728?auto=format&fit=crop&w=400&q=80');"></div>
            <div class="poster-card" style="background-image: url('https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?auto=format&fit=crop&w=400&q=80');"></div>
            <div class="poster-card" style="background-image: url('https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=400&q=80');"></div>
        </div>
    </section>

</body>
</html>
