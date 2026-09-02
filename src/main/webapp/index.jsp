<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarePlus Health Hospital</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary-color: #0077b6;
            --secondary-color: #00b4d8;
            --accent-color: #caf0f8;
            --text-color: #2b2d42;
            --light-bg: #f8f9fa;
        }

        body {
            color: var(--text-color);
            line-height: 1.6;
        }

        /* Navigation */
        header {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem 2rem;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary-color);
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-color);
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--primary-color);
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0, 119, 182, 0.8), rgba(0, 180, 216, 0.8)), 
                        url('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&w=1200&q=80') center/cover;
            color: white;
            text-align: center;
            padding: 6rem 2rem;
        }

        .hero h1 {
            font-size: 2.8rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto 2rem;
        }

        .btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 0.8rem 1.8rem;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #005681;
        }

        /* Content Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 4rem 2rem;
        }

        .section-title {
            text-align: center;
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 2.5rem;
        }

        /* Services Grid */
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .service-card {
            background-color: var(--light-bg);
            padding: 2rem;
            border-radius: 8px;
            border-top: 4px solid var(--primary-color);
            text-align: center;
        }

        .service-card h3 {
            margin-bottom: 1rem;
            color: var(--primary-color);
        }

        /* Appointment Form */
        .appointment-section {
            background-color: var(--accent-color);
            border-radius: 10px;
            padding: 3rem 2rem;
        }

        .appointment-form {
            max-width: 600px;
            margin: 0 auto;
            display: grid;
            gap: 1.2rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .form-group input, 
        .form-group select, 
        .form-group textarea {
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        /* Footer */
        footer {
            background-color: var(--text-color);
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 4rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-links {
                display: none; /* Can be toggled with JavaScript if needed */
            }
            .hero h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

    <!-- Header / Navigation -->
    <header>
        <nav>
            <div class="logo">🏥 CarePlus Hospital</div>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#appointment">Book Appointment</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <h1>Compassionate Care, Advanced Medicine</h1>
        <p>Providing 24/7 world-class healthcare services with experienced specialists and modern technology.</p>
        <a href="#appointment" class="btn">Book an Appointment</a>
    </section>

    <!-- Services Section -->
    <section class="container" id="services">
        <h2 class="section-title">Our Medical Services</h2>
        <div class="services-grid">
            <div class="service-card">
                <h3>Emergency Care</h3>
                <p>24/7 emergency response equipped with advanced life-support systems and trauma specialists.</p>
            </div>
            <div class="service-card">
                <h3>Cardiology</h3>
                <p>Comprehensive heart health evaluations, non-invasive testing, and specialized treatments.</p>
            </div>
            <div class="service-card">
                <h3>Pediatrics</h3>
                <p>Dedicated medical care, routine check-ups, and vaccinations for infants, children, and teens.</p>
            </div>
            <div class="service-card">
                <h3>Neurology</h3>
                <p>Expert diagnosis and treatment plans for complex neurological and brain disorders.</p>
            </div>
        </div>
    </section>

    <!-- Appointment Form Section -->
    <section class="container" id="appointment">
        <div class="appointment-section">
            <h2 class="section-title">Schedule an Appointment</h2>
            <form class="appointment-form" onsubmit="alert('Appointment request submitted!'); return false;">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" required placeholder="John Doe">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" required placeholder="(123) 456-7890">
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <select id="department" required>
                        <option value="">Select Department</option>
                        <option value="cardiology">Cardiology</option>
                        <option value="pediatrics">Pediatrics</option>
                        <option value="neurology">Neurology</option>
                        <option value="general">General Medicine</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="date">Preferred Date</label>
                    <input type="date" id="date" required>
                </div>
                <button type="submit" class="btn">Confirm Booking</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <p><strong>CarePlus Hospital</strong> | 123 Healthcare Blvd, Medical City</p>
        <p>Emergency Line: (555) 019-2834 | Email: contact@careplus.org</p>
        <p style="margin-top: 1rem; font-size: 0.9rem;">&copy; 2026 CarePlus Health. All rights reserved.</p>
    </footer>

</body>
</html>
