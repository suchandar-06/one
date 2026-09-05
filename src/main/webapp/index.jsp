<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Video Clone</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Amazon Ember', Arial, sans-serif;
        }

        body {
            background-color: #0f171e;
            color: #ffffff;
            overflow-x: hidden;
        }

        /* Top Header Navigation */
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 40px;
            background-color: #1b2530;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #00a8e1; /* Prime Blue */
            text-decoration: none;
        }

        .logo span {
            color: #ffffff;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 20px;
        }

        .nav-menu a {
            color: #8197a4;
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 600;
            transition: color 0.2s;
        }

        .nav-menu a:hover, .nav-menu a.active {
            color: #ffffff;
        }

        .search-bar input {
            background-color: #25313d;
            border: 1px solid #334454;
            padding: 8px 16px;
            border-radius: 4px;
            color: #ffffff;
            outline: none;
            width: 220px;
        }

        /* Hero Banner */
        .hero {
            position: relative;
            height: 70vh;
            background: linear-gradient(to right, #0f171e 30%, transparent 80%),
                        linear-gradient(to top, #0f171e 5%, transparent 30%),
                        url('https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=1600&q=80') center/cover;
            display: flex;
            align-items: center;
            padding: 0 50px;
        }

        .hero-details {
            max-width: 550px;
        }

        .prime-badge {
            color: #00a8e1;
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .hero-title {
            font-size: 3rem;
            margin-bottom: 15px;
            line-height: 1.1;
        }

        .hero-meta {
            color: #8197a4;
            font-size: 0.9rem;
            margin-bottom: 15px;
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .rating-tag {
            border: 1px solid #8197a4;
            padding: 1px 4px;
            border-radius: 2px;
            font-size: 0.75rem;
        }

        .hero-description {
            color: #cccccc;
            line-height: 1.5;
            margin-bottom: 25px;
            font-size: 0.95rem;
        }

        .hero-actions {
            display: flex;
            gap: 15px;
        }

        .btn-watch {
            background-color: #00a8e1;
            color: #ffffff;
            border: none;
            padding: 12px 28px;
            font-weight: bold;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-watch:hover {
            background-color: #0082b0;
        }

        /* Movie Grid / Slider */
        .shelf {
            padding: 25px 50px;
        }

        .shelf-title {
            font-size
