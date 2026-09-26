<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aura Market — Modern Boutique Experience</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        brand: {
                            50: '#eef2ff',
                            100: '#e0e7ff',
                            200: '#c7d2fe',
                            400: '#818cf8',
                            500: '#6366f1',
                            600: '#4f46e5',
                            700: '#4338ca',
                            900: '#312e81',
                        },
                    },
                    fontFamily: {
                        sans: ['"Plus Jakarta Sans"', 'Inter', 'system-ui', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <!-- Google Fonts & Lucide Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            -webkit-tap-highlight-color: transparent;
        }

        /* Glassmorphism effects */
        .glass-nav {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }

        /* Subtle scrollbars */
        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }
        ::-webkit-scrollbar-track {
            background: #f1f5f9;
        }
        ::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 9999px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }

        /* Toast animation */
        @keyframes toastSlideIn {
            from {
                opacity: 0;
                transform: translateY(20px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        .toast-animate {
            animation: toastSlideIn 0.25s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-900 antialiased min-h-screen flex flex-col selection:bg-indigo-500 selection:text-white">

    <!-- Top Announcement Bar -->
    <div class="bg-slate-900 text-slate-200 text-xs py-2 px-4 text-center tracking-wide font-medium flex items-center justify-center gap-2">
        <span class="inline-block w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
        <span>Spring Flash Sale: Use code <span class="text-white font-bold bg-slate-800 px-1.5 py-0.5 rounded border border-slate-700">AURA20</span> for 20% off all orders</span>
    </div>

    <!-- Sticky Header -->
    <header class="sticky top-0 z-40 glass-nav border-b border-slate-200/80 transition-all duration-300">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between gap-4">
            
            <!-- Brand Logo -->
            <div class="flex items-center gap-8">
                <a href="#" class="flex items-center gap-2 group">
                    <div class="w-10 h-10 rounded-xl bg-gradient-to-tr from-brand-600 to-indigo-400 flex items-center justify-center text-white shadow-md shadow-brand-500/20 group-hover:scale-105 transition-transform duration-200">
                        <i data-lucide="sparkles" class="w-5 h-5"></i>
                    </div>
                    <div>
                        <span class="text-xl font-extrabold tracking-tight text-slate-900 flex items-center gap-0.5">
                            AURA<span class="text-brand-600">.</span>
                        </span>
                        <span class="block text-[10px] uppercase font-semibold text-slate-400 tracking-wider -mt-1">Concept Studio</span>
                    </div>
                </a>
            </div>

            <!-- Global Live Search (Desktop) -->
            <div class="hidden md:flex flex-1 max-w-md mx-6">
                <div class="relative w-full">
                    <i data-lucide="search" class="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2"></i>
                    <input 
                        type="text" 
                        id="searchInput"
                        placeholder="Search gadgets, lifestyle, apparel..." 
                        class="w-full bg-slate-100/80 hover:bg-slate-100 focus:bg-white text-slate-800 text-sm pl-10 pr-9 py-2.5 rounded-full border border-slate-200/80 focus:outline-none focus:border-brand-500 focus:ring-4 focus:ring-brand-500/10 transition-all"
                    >
                    <button id="clearSearchBtn" class="hidden absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600">
                        <i data-lucide="x" class="w-4 h-4"></i>
                    </button>
                </div>
            </div>

            <!-- Header Action Icons -->
            <div class="flex items-center gap-2 sm:gap-3">
                <!-- Wishlist Trigger -->
                <button id="wishlistHeaderBtn" class="relative p-2.5 rounded-full text-slate-600 hover:text-brand-600 hover:bg-brand-50 transition-colors">
                    <i data-lucide="heart" class="w-5 h-5"></i>
                    <span id="wishlistCount" class="absolute top-1 right-1 bg-rose-500 text-white text-[10px] font-bold w-4 h-4 rounded-full flex items-center justify-center opacity-0 scale-50 transition-all duration-200">0</span>
                </button>

                <!-- Cart Button -->
                <button 
                    id="cartBtn" 
                    class="relative flex items-center gap-2.5 bg-brand-600 hover:bg-brand-700 text-white pl-3.5 pr-4 py-2.5 rounded-full shadow-md shadow-brand-600/25 active:scale-95 transition-all text-sm font-semibold"
                >
                    <div class="relative">
                        <i data-lucide="shopping-bag" class="w-4 h-4"></i>
                        <span id="cartCountBadge" class="absolute -top-2 -right-2 bg-amber-400 text-slate-900 text-[10px] font-extrabold w-4 h-4 rounded-full flex items-center justify-center">0</span>
                    </div>
                    <span class="hidden sm:inline" id="headerCartTotal">$0.00</span>
                </button>
            </div>
        </div>

        <!-- Mobile Search Bar (Collapsible/Always visible on small screens) -->
        <div class="px-4 pb-3 md:hidden">
            <div class="relative w-full">
                <i data-lucide="search" class="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2"></i>
                <input 
                    type="text" 
                    id="mobileSearchInput"
                    placeholder="Search curated products..." 
                    class="w-full bg-slate-100 text-slate-800 text-sm pl-10 pr-9 py-2.5 rounded-xl border border-slate-200 focus:outline-none focus:border-brand-500"
                >
            </div>
        </div>
    </header>

    <main class="flex-grow max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 w-full">
        
        <!-- Hero Tagline -->
        <div class="mb-8">
            <div class="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
                <div>
                    <div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-brand-100 text-brand-700 mb-2">
                        <i data-lucide="award" class="w-3.5 h-3.5"></i> Curated 2026 Collection
                    </div>
                    <h1 class="text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">Design-forward essentials.</h1>
                    <p class="text-slate-500 text-sm sm:text-base mt-1">High-quality lifestyle accessories, audio gear, and timeless daily items.</p>
                </div>

                <!-- Active Results Summary -->
                <div class="text-xs sm:text-sm text-slate-500 font-medium">
                    Showing <span id="resultsCount" class="font-bold text-slate-900">0</span> items
                </div>
            </div>
        </div>

        <!-- Filter & Sorting Controls -->
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 pb-6 border-b border-slate-200">
            <!-- Category Pills -->
            <div class="flex items-center gap-2 overflow-x-auto pb-2 md:pb-0 no-scrollbar">
                <button class="filter-pill active px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap bg-slate-900 text-white shadow-sm transition-all" data-category="all">
                    All Categories
                </button>
                <button class="filter-pill px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap bg-white text-slate-600 hover:text-slate-900 hover:bg-slate-100 border border-slate-200 transition-all" data-category="electronics">
                    Electronics
                </button>
                <button class="filter-pill px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap bg-white text-slate-600 hover:text-slate-900 hover:bg-slate-100 border border-slate-200 transition-all" data-category="lifestyle">
                    Lifestyle
                </button>
                <button class="filter-pill px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap bg-white text-slate-600 hover:text-slate-900 hover:bg-slate-100 border border-slate-200 transition-all" data-category="apparel">
                    Apparel
                </button>
                <button class="filter-pill px-4 py-2 rounded-full text-xs sm:text-sm font-semibold whitespace-nowrap bg-white text-slate-600 hover:text-slate-900 hover:bg-slate-100 border border-slate-200 transition-all" data-category="favorites">
                    Saved ❤️
                </button>
            </div>

            <!-- Sort By Dropdown -->
            <div class="flex items-center justify-end gap-2.5">
                <span class="text-xs font-semibold uppercase tracking-wider text-slate-400">Sort by:</span>
                <div class="relative">
                    <select id="sortSelect" class="appearance-none bg-white text-slate-700 text-xs sm:text-sm font-medium pl-3 pr-8 py-2 rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-brand-500/20 cursor-pointer">
                        <option value="featured">Featured First</option>
                        <option value="price-low">Price: Low to High</option>
                        <option value="price-high">Price: High to Low</option>
                        <option value="rating">Top Rated</option>
                    </select>
                    <i data-lucide="chevron-down" class="w-3.5 h-3.5 text-slate-400 absolute right-2.5 top-1/2 -translate-y-1/2 pointer-events-none"></i>
                </div>
            </div>
        </div>

        <!-- Product Grid -->
        <div id="productGrid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 sm:gap-7 mt-8">
            <!-- Dynamic Content loaded via JS -->
        </div>

        <!-- Empty State UI -->
        <div id="emptyState" class="hidden text-center py-20 px-4">
            <div class="w-16 h-16 bg-slate-100 text-slate-400 rounded-full flex items-center justify-center mx-auto mb-4">
                <i data-lucide="search-x" class="w-8 h-8"></i>
            </div>
            <h3 class="text-lg font-bold text-slate-800">No matching products found</h3>
            <p class="text-sm text-slate-500 mt-1 max-w-sm mx-auto">Try clearing your search terms or selecting another category filter.</p>
            <button id="resetFiltersBtn" class="mt-4 px-4 py-2 text-xs font-semibold text-brand-600 bg-brand-50 hover:bg-brand-100 rounded-lg transition-colors">
                Reset filters
            </button>
        </div>
    </main>

    <!-- Drawer Backdrop -->
    <div id="drawerOverlay" class="fixed inset-0 bg-slate-900/40 backdrop-blur-sm z-50 opacity-0 pointer-events-none transition-opacity duration-300"></div>

    <!-- Slide-Over Shopping Cart Drawer -->
    <aside id="cartDrawer" class="fixed top-0 right-0 h-full w-full sm:w-[420px] bg-white z-50 shadow-2xl flex flex-col transform translate-x-full transition-transform duration-300 ease-in-out">
        <!-- Header -->
        <div class="px-6 py-5 border-b border-slate-200 flex items-center justify-between bg-white">
            <div class="flex items-center gap-2">
                <i data-lucide="shopping-bag" class="w-5 h-5 text-brand-600"></i>
                <h3 class="font-bold text-lg text-slate-900">Your Bag</h3>
                <span id="drawerItemCountBadge" class="bg-brand-100 text-brand-700 text-xs px-2 py-0.5 rounded-full font-semibold">0 items</span>
            </div>
            <button id="closeCartBtn" class="p-2 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-100 transition-colors">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
        </div>

        <!-- Free Shipping Progress Tracker -->
        <div class="bg-indigo-50/60 px-6 py-3.5 border-b border-indigo-100/60">
            <div class="flex justify-between items-center text-xs mb-1.5 font-medium">
                <span id="shippingGoalText" class="text-indigo-900">Add $50.00 for FREE Express Shipping</span>
                <span id="shippingPercent" class="font-bold text-brand-700">0%</span>
            </div>
            <div class="w-full h-2 bg-indigo-100 rounded-full overflow-hidden">
                <div id="shippingProgressBar" class="h-full bg-brand-600 transition-all duration-300" style="width: 0%;"></div>
            </div>
        </div>

        <!-- Cart Items Scrollable List -->
        <div id="cartItemsList" class="flex-1 overflow-y-auto px-6 py-4 divide-y divide-slate-100">
            <!-- Dynamic Cart Items injected here -->
        </div>

        <!-- Footer / Checkout Section -->
        <div class="border-t border-slate-200 p-6 bg-slate-50 space-y-4">
            <!-- Promo Code Input -->
            <div class="flex gap-2">
                <div class="relative flex-1">
                    <input 
                        type="text" 
                        id="couponInput"
                        placeholder="Discount code (e.g. AURA20)" 
                        class="w-full text-xs uppercase bg-white border border-slate-200 rounded-xl px-3 py-2.5 focus:outline-none focus:border-brand-500 font-medium"
                    >
                </div>
                <button id="applyCouponBtn" class="bg-slate-900 hover:bg-slate-800 text-white text-xs font-semibold px-4 py-2.5 rounded-xl transition-colors">
                    Apply
                </button>
            </div>
            <div id="couponMessage" class="hidden text-xs font-medium"></div>

            <!-- Pricing Summary Breakdown -->
            <div class="space-y-1.5 text-xs text-slate-600">
                <div class="flex justify-between">
                    <span>Subtotal</span>
                    <span id="cartSubtotal" class="font-semibold text-slate-800">$0.00</span>
                </div>
                <div id="discountRow" class="hidden flex justify-between text-emerald-600">
                    <span>Discount (20%)</span>
                    <span id="cartDiscount" class="font-semibold">-$0.00</span>
                </div>
                <div class="flex justify-between">
                    <span>Shipping</span>
                    <span id="cartShipping" class="font-semibold text-slate-800">$0.00</span>
                </div>
                <div class="pt-2 border-t border-slate-200 flex justify-between text-base font-bold text-slate-900">
                    <span>Total</span>
                    <span id="cartGrandTotal">$0.00</span>
                </div>
            </div>

            <!-- Checkout CTA Button -->
            <button 
                id="checkoutBtn" 
                class="w-full bg-brand-600 hover:bg-brand-700 text-white py-3.5 px-4 rounded-xl font-bold flex items-center justify-center gap-2 shadow-lg shadow-brand-600/20 active:scale-[0.99] transition-all"
            >
                <span>Checkout Now</span>
                <i data-lucide="arrow-right" class="w-4 h-4"></i>
            </button>
        </div>
    </aside>

    <div id="quickViewModal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/60 backdrop-blur-sm opacity-0 pointer-events-none transition-all duration-200">
        <div class="bg-white rounded-3xl max-w-2xl w-full overflow-hidden shadow-2xl transform scale-95 transition-all duration-200 relative">
            <button id="closeQuickViewBtn" class="absolute top-4 right-4 z-10 w-9 h-9 rounded-full bg-white/90 backdrop-blur shadow-md flex items-center justify-center text-slate-500 hover:text-slate-900">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
            <div class="grid grid-cols-1 md:grid-cols-2">
                <div class="h-64 md:h-full bg-slate-100 relative">
                    <img id="modalImg" src="" alt="" class="w-full h-full object-cover">
                    <span id="modalBadge" class="absolute top-4 left-4 text-[10px] font-bold tracking-wider uppercase px-2.5 py-1 rounded-full bg-brand-600 text-white shadow">
                        Popular
                    </span>
                </div>
                <div class="p-6 md:p-8 flex flex-col justify-between">
                    <div>
                        <span id="modalCategory" class="text-xs uppercase tracking-wider font-semibold text-brand-600">Category</span>
                        <h2 id="modalTitle" class="text-xl font-bold text-slate-900 mt-1">Product Title</h2>
                        
                        <div class="flex items-center gap-2 mt-2">
                            <div class="flex items-center text-amber-400">
                                <i data-lucide="star" class="w-4 h-4 fill-amber-400"></i>
                                <span id="modalRating" class="text-xs font-bold text-slate-700 ml-1">4.9</span>
                            </div>
                            <span class="text-slate-300">·</span>
                            <span id="modalReviews" class="text-xs text-slate-500 font-medium">124 reviews</span>
                            <span class="text-slate-300">·</span>
                            <span class="text-xs font-semibold text-emerald-600 flex items-center gap-1">
                                <i data-lucide="check" class="w-3 h-3"></i> In Stock
                            </span>
                        </div>

                        <p id="modalDescription" class="text-slate-600 text-sm mt-4 leading-relaxed">
                            Crafted for refined daily use with carefully chosen materials, built to elevate productivity and personal comfort.
                        </p>
                    </div>

                    <div class="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between">
                        <div>
                            <span class="text-xs text-slate-400 block font-medium">Price</span>
                            <span id="modalPrice" class="text-2xl font-black text-slate-900">$0.00</span>
                        </div>
                        <button id="modalAddToCartBtn" class="bg-brand-600 hover:bg-brand-700 text-white font-semibold px-6 py-3 rounded-xl flex items-center gap-2 shadow-md shadow-brand-600/20 active:scale-95 transition-all text-sm">
                            <i data-lucide="shopping-cart" class="w-4 h-4"></i> Add to Bag
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="toastContainer" class="fixed bottom-6 right-6 z-50 flex flex-col gap-2.5 pointer-events-none"></div>

    <script>
        // Catalog dataset enriched with badges, ratings, and descriptions
        const products = [
            {
                id: 1,
                title: 'Aura Studio Wireless ANC',
                category: 'electronics',
                price: 129.99,
                rating: 4.9,
                reviews: 240,
                badge: 'Best Seller',
                description: 'Custom acoustic architecture with active noise cancellation and 40-hour continuous playback battery.',
                image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 2,
                title: 'Nordic Horizon Minimal Watch',
                category: 'lifestyle',
                price: 89.00,
                rating: 4.8,
                reviews: 95,
                badge: 'New',
                description: 'Brushed stainless steel bezel, sapphire crystal face, and genuine vegetable-tanned leather strap.',
                image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 3,
                title: 'Lumio Ergonomic Desk Lamp',
                category: 'lifestyle',
                price: 45.50,
                rating: 4.6,
                reviews: 80,
                badge: 'Popular',
                description: 'Warm ambient LED lightbar with touch dimmer, integrated Qi fast wireless charger, and flexible neck.',
                image: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 4,
                title: 'Heavyweight Loopback Hoodie',
                category: 'apparel',
                price: 59.99,
                rating: 4.7,
                reviews: 160,
                badge: 'Sale',
                description: 'Pre-shrunk 460GSM French terry cotton with relaxed dropped shoulders and double-lined hood.',
                image: 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 5,
                title: 'Keychron Linear Mechanical',
                category: 'electronics',
                price: 109.00,
                rating: 4.9,
                reviews: 310,
                badge: 'Top Rated',
                description: 'Hot-swappable tactile switches, frosted PBT keycaps, sound dampening foam, and multi-device Bluetooth.',
                image: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 6,
                title: 'Voyager Heritage Leather Bag',
                category: 'apparel',
                price: 140.00,
                rating: 4.8,
                reviews: 114,
                badge: 'Handcrafted',
                description: 'Water-resistant waxed canvas and full-grain leather pack with padded 16-inch laptop compartment.',
                image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 7,
                title: 'Aura Pods Pro Spatial Sound',
                category: 'electronics',
                price: 79.99,
                rating: 4.7,
                reviews: 145,
                badge: 'Sale',
                description: 'Ultra-compact earbuds with transparency mode, silicone contoured tips, and IPX5 moisture resistance.',
                image: 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 8,
                title: 'Artisan Ceramic Tumbler 380ml',
                category: 'lifestyle',
                price: 28.00,
                rating: 4.9,
                reviews: 62,
                badge: 'Eco',
                description: 'Double-walled thermal ceramic tumbler with leakproof bamboo twist cap, preserves heat up to 8 hours.',
                image: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=650&q=80'
            }
        ];

        // App state
        let cart = [];
        let wishlist = new Set();
        let activeCategory = 'all';
        let searchQuery = '';
        let sortBy = 'featured';
        let discountPercent = 0;
        const FREE_SHIPPING_THRESHOLD = 150;

        // DOM Elements
        const productGrid = document.getElementById('productGrid');
        const emptyState = document.getElementById('emptyState');
        const resultsCount = document.getElementById('resultsCount');
        const searchInput = document.getElementById('searchInput');
        const mobileSearchInput = document.getElementById('mobileSearchInput');
        const clearSearchBtn = document.getElementById('clearSearchBtn');
        const sortSelect = document.getElementById('sortSelect');
        const cartDrawer = document.getElementById('cartDrawer');
        const drawerOverlay = document.getElementById('drawerOverlay');
        const cartBtn = document.getElementById('cartBtn');
        const closeCartBtn = document.getElementById('closeCartBtn');
        const cartItemsList = document.getElementById('cartItemsList');
        const cartCountBadge = document.getElementById('cartCountBadge');
        const headerCartTotal = document.getElementById('headerCartTotal');
        const drawerItemCountBadge = document.getElementById('drawerItemCountBadge');
        const cartSubtotal = document.getElementById('cartSubtotal');
        const cartDiscount = document.getElementById('cartDiscount');
        const discountRow = document.getElementById('discountRow');
        const cartShipping = document.getElementById('cartShipping');
        const cartGrandTotal = document.getElementById('cartGrandTotal');
        const shippingProgressBar = document.getElementById('shippingProgressBar');
        const shippingGoalText = document.getElementById('shippingGoalText');
        const shippingPercent = document.getElementById('shippingPercent');
        const couponInput = document.getElementById('couponInput');
        const applyCouponBtn = document.getElementById('applyCouponBtn');
        const couponMessage = document.getElementById('couponMessage');
        const toastContainer = document.getElementById('toastContainer');
        const wishlistCount = document.getElementById('wishlistCount');
        const quickViewModal = document.getElementById('quickViewModal');
        const closeQuickViewBtn = document.getElementById('closeQuickViewBtn');
        const modalAddToCartBtn = document.getElementById('modalAddToCartBtn');
        let currentModalProductId = null;

        function getFilteredAndSortedProducts() {
            return products.filter(product => {
                const matchesCategory = 
                    activeCategory === 'all' ? true :
                    activeCategory === 'favorites' ? wishlist.has(product.id) :
                    product.category === activeCategory;

                const matchesSearch = product.title.toLowerCase().includes(searchQuery.toLowerCase()) || 
                                      product.category.toLowerCase().includes(searchQuery.toLowerCase());
                return matchesCategory && matchesSearch;
            }).sort((a, b) => {
                if (sortBy === 'price-low') return a.price - b.price;
                if (sortBy === 'price-high') return b.price - a.price;
                if (sortBy === 'rating') return b.rating - a.rating;
                return a.id - b.id; // default
            });
        }

        function renderProducts() {
            const items = getFilteredAndSortedProducts();
            resultsCount.textContent = items.length;

            if (items.length === 0) {
                productGrid.innerHTML = '';
                emptyState.classList.remove('hidden');
                return;
            }

            emptyState.classList.add('hidden');
            productGrid.innerHTML = items.map(product => {
                const isSaved = wishlist.has(product.id);
                return `
                    <div class="group bg-white rounded-2xl border border-slate-200/90 overflow-hidden hover:border-slate-300 hover:shadow-xl hover:shadow-slate-200/60 transition-all duration-300 flex flex-col relative">
                        <!-- Product Image Box -->
                        <div class="relative w-full aspect-square bg-slate-100 overflow-hidden cursor-pointer" onclick="openQuickView(${product.id})">
                            <img 
                                src="${product.image}" 
                                alt="${product.title}" 
                                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out"
                                loading="lazy"
                            >
                            <!-- Badge -->
                            <div class="absolute top-3 left-3 flex flex-col gap-1">
                                <span class="bg-white/95 backdrop-blur text-slate-800 text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded-full shadow-sm">
                                    ${product.badge}
                                </span>
                            </div>

                            <!-- Wishlist Button -->
                            <button 
                                onclick="event.stopPropagation(); toggleWishlist(${product.id})"
                                class="absolute top-3 right-3 w-9 h-9 rounded-full bg-white/90 backdrop-blur shadow-sm hover:scale-110 flex items-center justify-center transition-all ${isSaved ? 'text-rose-500' : 'text-slate-400 hover:text-slate-700'}"
                                aria-label="Save to favorites"
                            >
                                <i data-lucide="heart" class="w-4 h-4 ${isSaved ? 'fill-rose-500' : ''}"></i>
                            </button>

                            <!-- Quick View Overlay hint -->
                            <div class="absolute inset-x-0 bottom-0 py-2.5 bg-gradient-to-t from-slate-900/60 to-transparent opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-white text-xs font-semibold gap-1">
                                <i data-lucide="eye" class="w-3.5 h-3.5"></i> Quick View
                            </div>
                        </div>

                        <!-- Product Details -->
                        <div class="p-5 flex flex-col flex-1 justify-between">
                            <div>
                                <div class="flex items-center justify-between text-xs text-slate-400 font-medium mb-1.5">
                                    <span class="uppercase tracking-wider font-semibold text-brand-600">${product.category}</span>
                                    <div class="flex items-center gap-1 text-amber-500">
                                        <i data-lucide="star" class="w-3 h-3 fill-amber-400 text-amber-400"></i>
                                        <span class="font-bold text-slate-700">${product.rating}</span>
                                        <span class="text-slate-400 text-[11px]">(${product.reviews})</span>
                                    </div>
                                </div>
                                <h3 class="text-sm sm:text-base font-bold text-slate-900 line-clamp-1 hover:text-brand-600 cursor-pointer transition-colors" onclick="openQuickView(${product.id})">
                                    ${product.title}
                                </h3>
                                <p class="text-xs text-slate-500 mt-1 line-clamp-2 leading-relaxed">
                                    ${product.description}
                                </p>
                            </div>

                            <div class="pt-4 mt-4 border-t border-slate-100 flex items-center justify-between">
                                <span class="text-lg font-black text-slate-900">
                                    $${product.price.toFixed(2)}
                                </span>
                                <button 
                                    onclick="addToCart(${product.id})"
                                    class="bg-slate-900 hover:bg-brand-600 text-white text-xs font-semibold px-3.5 py-2.5 rounded-xl flex items-center gap-1.5 active:scale-95 transition-all shadow-sm"
                                >
                                    <i data-lucide="plus" class="w-3.5 h-3.5"></i> Add
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');

            lucide.createIcons();
        }

        function toggleWishlist(productId) {
            const product = products.find(p => p.id === productId);
            if (wishlist.has(productId)) {
                wishlist.delete(productId);
                showToast(`Removed "${product.title}" from wishlist`, 'info');
            } else {
                wishlist.add(productId);
                showToast(`Saved "${product.title}" to wishlist ❤️`, 'success');
            }
            updateWishlistBadge();
            renderProducts();
        }

        function updateWishlistBadge() {
            wishlistCount.textContent = wishlist.size;
            if (wishlist.size > 0) {
                wishlistCount.classList.remove('opacity-0', 'scale-50');
            } else {
                wishlistCount.classList.add('opacity-0', 'scale-50');
            }
        }

        function showToast(message, type = 'success') {
            const toast = document.createElement('div');
            const bgClass = type === 'success' ? 'bg-slate-900 text-white' : 'bg-slate-800 text-slate-200';
            const icon = type === 'success' ? 'check-circle' : 'info';
            
            toast.className = `${bgClass} text-xs font-semibold px-4 py-3 rounded-2xl shadow-xl border border-slate-700/50 flex items-center gap-2.5 toast-animate pointer-events-auto`;
            toast.innerHTML = `
                <i data-lucide="${icon}" class="w-4 h-4 text-emerald-400"></i>
                <span>${message}</span>
            `;
            toastContainer.appendChild(toast);
            lucide.createIcons();

            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translateY(10px) scale(0.95)';
                toast.style.transition = 'all 0.25s ease';
                setTimeout(() => toast.remove(), 250);
            }, 2600);
        }

        function addToCart(productId, quantity = 1) {
            const product = products.find(p => p.id === productId);
            const existing = cart.find(item => item.id === productId);

            if (existing) {
                existing.quantity += quantity;
            } else {
                cart.push({ ...product, quantity });
            }

            updateCartUI();
            openCart();
            showToast(`Added "${product.title}" to bag!`);
        }

        function changeQuantity(productId, delta) {
            const item = cart.find(i => i.id === productId);
            if (!item) return;

            item.quantity += delta;
            if (item.quantity <= 0) {
                removeFromCart(productId);
                return;
            }
            updateCartUI();
        }

        function removeFromCart(productId) {
            const item = cart.find(i => i.id === productId);
            cart = cart.filter(i => i.id !== productId);
            updateCartUI();
            if (item) showToast(`Removed "${item.title}" from bag`, 'info');
        }

        function updateCartUI() {
            const totalQty = cart.reduce((sum, item) => sum + item.quantity, 0);
            const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            const discountAmount = subtotal * discountPercent;
            const shipping = (subtotal > 0 && subtotal < FREE_SHIPPING_THRESHOLD) ? 12.00 : 0;
            const grandTotal = Math.max(0, subtotal - discountAmount + shipping);

            // Update Badges
            cartCountBadge.textContent = totalQty;
            drawerItemCountBadge.textContent = `${totalQty} item${totalQty === 1 ? '' : 's'}`;
            headerCartTotal.textContent = `$${subtotal.toFixed(2)}`;

            // Pricing breakdowns
            cartSubtotal.textContent = `$${subtotal.toFixed(2)}`;
            cartDiscount.textContent = `-$${discountAmount.toFixed(2)}`;
            cartShipping.textContent = shipping === 0 ? (subtotal === 0 ? '$0.00' : 'FREE') : `$${shipping.toFixed(2)}`;
            cartGrandTotal.textContent = `$${grandTotal.toFixed(2)}`;

            if (discountPercent > 0) {
                discountRow.classList.remove('hidden');
            } else {
                discountRow.classList.add('hidden');
            }

            // Free shipping bar calculation
            const progress = Math.min(100, (subtotal / FREE_SHIPPING_THRESHOLD) * 100);
            shippingProgressBar.style.width = `${progress}%`;
            shippingPercent.textContent = `${Math.round(progress)}%`;

            if (subtotal >= FREE_SHIPPING_THRESHOLD) {
                shippingGoalText.innerHTML = `🎉 You unlocked <strong>FREE Express Shipping!</strong>`;
            } else if (subtotal === 0) {
                shippingGoalText.textContent = `Add $${FREE_SHIPPING_THRESHOLD}.00 for FREE Express Shipping`;
            } else {
                const diff = (FREE_SHIPPING_THRESHOLD - subtotal).toFixed(2);
                shippingGoalText.innerHTML = `Add <strong>$${diff}</strong> more to get <strong>FREE Express Shipping</strong>`;
            }

            // Render Cart Drawer list
            if (cart.length === 0) {
                cartItemsList.innerHTML = `
                    <div class="h-full flex flex-col items-center justify-center text-center py-16 text-slate-400">
                        <div class="w-14 h-14 rounded-full bg-slate-100 flex items-center justify-center mb-3">
                            <i data-lucide="shopping-bag" class="w-6 h-6 text-slate-300"></i>
                        </div>
                        <p class="font-bold text-slate-700 text-sm">Your shopping bag is empty</p>
                        <p class="text-xs text-slate-400 mt-1 max-w-[200px]">Discover our curated goods and fill up your cart.</p>
                    </div>
                `;
            } else {
                cartItemsList.innerHTML = cart.map(item => `
                    <div class="py-4 flex gap-3.5 items-center">
                        <img src="${item.image}" alt="${item.title}" class="w-16 h-16 rounded-xl object-cover border border-slate-100 flex-shrink-0">
                        <div class="flex-1 min-w-0">
                            <h4 class="text-xs sm:text-sm font-semibold text-slate-800 truncate">${item.title}</h4>
                            <span class="text-xs text-slate-400 font-medium">$${item.price.toFixed(2)} each</span>
                            
                            <div class="flex items-center gap-2 mt-2">
                                <div class="inline-flex items-center border border-slate-200 rounded-lg bg-white">
                                    <button onclick="changeQuantity(${item.id}, -1)" class="w-6 h-6 flex items-center justify-center text-slate-500 hover:text-slate-900 active:bg-slate-100 rounded-l">
                                        <i data-lucide="minus" class="w-3 h-3"></i>
                                    </button>
                                    <span class="w-7 text-center text-xs font-bold text-slate-800">${item.quantity}</span>
                                    <button onclick="changeQuantity(${item.id}, 1)" class="w-6 h-6 flex items-center justify-center text-slate-500 hover:text-slate-900 active:bg-slate-100 rounded-r">
                                        <i data-lucide="plus" class="w-3 h-3"></i>
                                    </button>
                                </div>

                                <button onclick="removeFromCart(${item.id})" class="text-slate-400 hover:text-rose-500 p-1 transition-colors" title="Delete">
                                    <i data-lucide="trash-2" class="w-3.5 h-3.5"></i>
                                </button>
                            </div>
                        </div>
                        <div class="text-right">
                            <span class="font-bold text-xs sm:text-sm text-slate-900">
                                $${(item.price * item.quantity).toFixed(2)}
                            </span>
                        </div>
                    </div>
                `).join('');
            }

            lucide.createIcons();
        }

        function openCart() {
            cartDrawer.classList.remove('translate-x-full');
            drawerOverlay.classList.remove('opacity-0', 'pointer-events-none');
            document.body.style.overflow = 'hidden';
        }

        function closeCart() {
            cartDrawer.classList.add('translate-x-full');
            drawerOverlay.classList.add('opacity-0', 'pointer-events-none');
            document.body.style.overflow = '';
        }

        function openQuickView(id) {
            const product = products.find(p => p.id === id);
            if (!product) return;

            currentModalProductId = product.id;
            document.getElementById('modalImg').src = product.image;
            document.getElementById('modalTitle').textContent = product.title;
            document.getElementById('modalCategory').textContent = product.category;
            document.getElementById('modalBadge').textContent = product.badge;
            document.getElementById('modalRating').textContent = product.rating;
            document.getElementById('modalReviews').textContent = `${product.reviews} reviews`;
            document.getElementById('modalPrice').textContent = `$${product.price.toFixed(2)}`;
            document.getElementById('modalDescription').textContent = product.description;

            quickViewModal.classList.remove('opacity-0', 'pointer-events-none');
            quickViewModal.children[0].classList.remove('scale-95');
            document.body.style.overflow = 'hidden';
            lucide.createIcons();
        }

        function closeQuickView() {
            quickViewModal.classList.add('opacity-0', 'pointer-events-none');
            quickViewModal.children[0].classList.add('scale-95');
            if (cartDrawer.classList.contains('translate-x-full')) {
                document.body.style.overflow = '';
            }
        }

        // Coupon Logic
        applyCouponBtn.addEventListener('click', () => {
            const val = couponInput.value.trim().toUpperCase();
            if (val === 'AURA20') {
                discountPercent = 0.20;
                couponMessage.textContent = '✓ 20% discount applied successfully!';
                couponMessage.className = 'text-xs font-semibold text-emerald-600';
                couponMessage.classList.remove('hidden');
                updateCartUI();
            } else if (val === '') {
                couponMessage.textContent = 'Please enter a coupon code.';
                couponMessage.className = 'text-xs font-semibold text-rose-500';
                couponMessage.classList.remove('hidden');
            } else {
                couponMessage.textContent = 'Invalid promo code. Try "AURA20"';
                couponMessage.className = 'text-xs font-semibold text-rose-500';
                couponMessage.classList.remove('hidden');
            }
        });

        // Category Pill Filter Clicks
        document.querySelectorAll('.filter-pill').forEach(btn => {
            btn.addEventListener('click', (e) => {
                document.querySelectorAll('.filter-pill').forEach(b => {
                    b.classList.remove('active', 'bg-slate-900', 'text-white');
                    b.classList.add('bg-white', 'text-slate-600');
                });
                btn.classList.add('active', 'bg-slate-900', 'text-white');
                btn.classList.remove('bg-white', 'text-slate-600');
                activeCategory = btn.getAttribute('data-category');
                renderProducts();
            });
        });

        // Search Handlers
        function handleSearchInput(e) {
            searchQuery = e.target.value;
            searchInput.value = searchQuery;
            mobileSearchInput.value = searchQuery;

            if (searchQuery.length > 0) {
                clearSearchBtn.classList.remove('hidden');
            } else {
                clearSearchBtn.classList.add('hidden');
            }
            renderProducts();
        }

        searchInput.addEventListener('input', handleSearchInput);
        mobileSearchInput.addEventListener('input', handleSearchInput);

        clearSearchBtn.addEventListener('click', () => {
            searchQuery = '';
            searchInput.value = '';
            mobileSearchInput.value = '';
            clearSearchBtn.classList.add('hidden');
            renderProducts();
        });

        document.getElementById('resetFiltersBtn').addEventListener('click', () => {
            searchQuery = '';
            searchInput.value = '';
            mobileSearchInput.value = '';
            clearSearchBtn.classList.add('hidden');
            document.querySelector('[data-category="all"]').click();
        });

        // Sort Handler
        sortSelect.addEventListener('change', (e) => {
            sortBy = e.target.value;
            renderProducts();
        });

        // Drawer toggles
        cartBtn.addEventListener('click', openCart);
        closeCartBtn.addEventListener('click', closeCart);
        drawerOverlay.addEventListener('click', closeCart);

        // Modal triggers
        closeQuickViewBtn.addEventListener('click', closeQuickView);
        quickViewModal.addEventListener('click', (e) => {
            if (e.target === quickViewModal) closeQuickView();
        });

        modalAddToCartBtn.addEventListener('click', () => {
            if (currentModalProductId) {
                addToCart(currentModalProductId);
                closeQuickView();
            }
        });

        // Wishlist header icon jump to saved
        document.getElementById('wishlistHeaderBtn').addEventListener('click', () => {
            const savedPill = document.querySelector('[data-category="favorites"]');
            if (savedPill) savedPill.click();
        });

        // Checkout Button Action
        document.getElementById('checkoutBtn').addEventListener('click', () => {
            if (cart.length === 0) {
                showToast('Your bag is empty! Add items first.', 'info');
                return;
            }
            showToast('Order placed! Redirecting to secure checkout...', 'success');
            setTimeout(() => {
                cart = [];
                discountPercent = 0;
                couponInput.value = '';
                couponMessage.classList.add('hidden');
                updateCartUI();
                closeCart();
            }, 1800);
        });

        // Keyboard escape accessibility
        window.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                closeCart();
                closeQuickView();
            }
        });

        // Initialization
        renderProducts();
        updateCartUI();
        lucide.createIcons();
    </script>
</body>
</html>
