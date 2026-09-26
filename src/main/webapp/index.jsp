<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aura Market - Modern E-Commerce</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['"Plus Jakarta Sans"', 'sans-serif'],
                    },
                    colors: {
                        brand: {
                            50: '#eef2ff',
                            100: '#e0e7ff',
                            500: '#4f46e5',
                            600: '#4338ca',
                            700: '#3730a3',
                        }
                    }
                }
            }
        }
    </script>
    <style>
        .custom-scroll::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }
        .custom-scroll::-webkit-scrollbar-track {
            background: transparent;
        }
        .custom-scroll::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 4px;
        }
        .custom-scroll::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-900 font-sans min-h-screen flex flex-col antialiased selection:bg-brand-500 selection:text-white">

    <!-- Top Announcement Bar -->
    <div class="bg-slate-900 text-slate-200 text-xs py-2 px-4 text-center tracking-wide font-medium flex items-center justify-center gap-2">
        <span class="inline-block w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
        Summer Drop is Live! Get 20% off with code <strong class="text-white underline decoration-brand-500 underline-offset-2">AURA20</strong>
    </div>

    <!-- Navigation Bar -->
    <header class="sticky top-0 z-40 bg-white/80 backdrop-blur-md border-b border-slate-200/80 transition-all">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-18 flex items-center justify-between gap-4 py-3.5">
            <!-- Brand -->
            <a href="#" class="flex items-center gap-2.5 text-2xl font-extrabold tracking-tight text-slate-900 group">
                <span class="w-10 h-10 rounded-xl bg-brand-500 text-white flex items-center justify-center shadow-lg shadow-brand-500/25 group-hover:scale-105 transition-transform">
                    ✦
                </span>
                <span>Aura<span class="text-brand-500">.</span></span>
            </a>

            <!-- Search Bar (Accessibility Fixed: Associated Label + aria-label) -->
            <div class="hidden sm:flex flex-1 max-w-md mx-6 relative">
                <label for="searchInput" class="sr-only">Search products, categories, or styles</label>
                <div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none text-slate-400">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
                <input
                    type="text"
                    id="searchInput"
                    name="search"
                    aria-label="Search products, categories, or styles"
                    placeholder="Search gadgets, lifestyle, apparel..."
                    class="w-full bg-slate-100/80 hover:bg-slate-100 focus:bg-white text-slate-800 text-sm pl-10 pr-9 py-2.5 rounded-full border border-slate-200/80 focus:outline-none focus:border-brand-500 focus:ring-4 focus:ring-brand-500/10 transition-all"
                    oninput="handleSearch(this.value)"
                />
                <button
                    type="button"
                    id="clearSearch"
                    aria-label="Clear search text"
                    title="Clear search"
                    onclick="clearSearchInput()"
                    class="hidden absolute inset-y-0 right-0 pr-3.5 flex items-center text-slate-400 hover:text-slate-600 transition-colors"
                >
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <!-- Action buttons -->
            <div class="flex items-center gap-2">
                <!-- Cart Button -->
                <button 
                    id="cartBtn" 
                    type="button"
                    aria-label="View shopping cart" 
                    title="Open Cart" 
                    class="relative p-2.5 rounded-full hover:bg-slate-100 active:scale-95 transition-all text-slate-700"
                >
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path>
                    </svg>
                    <span id="cartCount" class="absolute -top-1 -right-1 bg-brand-500 text-white font-bold text-xs min-w-[20px] h-5 px-1.5 rounded-full flex items-center justify-center shadow-md scale-100 transition-transform">0</span>
                </button>
            </div>
        </div>

        <!-- Mobile Search (Fixed accessibility) -->
        <div class="sm:hidden px-4 pb-3">
            <label for="mobileSearchInput" class="sr-only">Search products</label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-slate-400">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
                <input 
                    type="text" 
                    id="mobileSearchInput"
                    name="mobile-search"
                    aria-label="Search products"
                    placeholder="Search catalog..." 
                    class="w-full bg-slate-100 text-slate-800 text-sm pl-9 pr-4 py-2 rounded-full border border-slate-200 focus:outline-none focus:border-brand-500 focus:bg-white"
                    oninput="handleSearch(this.value)"
                />
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 flex-1 w-full">
        <!-- Hero Banner -->
        <div class="relative overflow-hidden rounded-3xl bg-gradient-to-r from-slate-950 via-slate-900 to-indigo-950 text-white p-8 sm:p-12 mb-10 shadow-2xl">
            <div class="relative z-10 max-w-xl">
                <span class="inline-block text-xs font-semibold uppercase tracking-wider text-brand-500 bg-brand-500/10 px-3 py-1 rounded-full mb-3 border border-brand-500/20">Essential Curations</span>
                <h1 class="text-3xl sm:text-5xl font-extrabold tracking-tight mb-4 leading-tight">Elevate your workspace & daily lifestyle.</h1>
                <p class="text-slate-300 text-sm sm:text-base leading-relaxed mb-6">Designed with obsessive precision. Minimal aesthetic, optimal performance, sustainable craftsmanship.</p>
                <a href="#productGrid" class="inline-flex items-center gap-2 bg-brand-500 hover:bg-brand-600 text-white font-semibold text-sm px-6 py-3 rounded-full transition-all shadow-lg shadow-brand-500/30">
                    Explore Collection
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                </a>
            </div>
            <!-- Decorative circle -->
            <div class="absolute -right-20 -bottom-20 w-80 h-80 bg-brand-500/20 rounded-full blur-3xl pointer-events-none"></div>
        </div>

        <!-- Controls: Filters & Sorting (Fixed Select Label accessibility) -->
        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
            <!-- Filter Pills -->
            <div class="flex flex-wrap gap-2" id="filterContainer">
                <button type="button" class="filter-btn active px-4 py-2 rounded-full text-xs sm:text-sm font-semibold transition-all bg-brand-500 text-white shadow-sm" onclick="filterProducts('all', this)">All Items</button>
                <button type="button" class="filter-btn px-4 py-2 rounded-full text-xs sm:text-sm font-semibold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterProducts('electronics', this)">Electronics</button>
                <button type="button" class="filter-btn px-4 py-2 rounded-full text-xs sm:text-sm font-semibold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterProducts('lifestyle', this)">Lifestyle</button>
                <button type="button" class="filter-btn px-4 py-2 rounded-full text-xs sm:text-sm font-semibold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterProducts('apparel', this)">Apparel</button>
            </div>

            <!-- Sort By Select with Accessible Label -->
            <div class="flex items-center gap-2 self-end sm:self-auto">
                <label for="sortSelect" class="text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">Sort By:</label>
                <select 
                    id="sortSelect" 
                    name="sort"
                    aria-label="Sort products by" 
                    onchange="handleSort(this.value)" 
                    class="bg-white border border-slate-200 text-slate-700 text-sm font-medium rounded-xl px-3 py-2 pr-8 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/10 cursor-pointer shadow-sm"
                >
                    <option value="default">Featured</option>
                    <option value="price-low">Price: Low to High</option>
                    <option value="price-high">Price: High to Low</option>
                    <option value="name">Alphabetical</option>
                </select>
            </div>
        </div>

        <!-- Catalog Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8" id="productGrid">
            <!-- Dynamic Cards Loaded via JS -->
        </div>

        <!-- Empty Results Placeholder -->
        <div id="noResults" class="hidden text-center py-20">
            <div class="w-16 h-16 mx-auto bg-slate-100 rounded-full flex items-center justify-center text-slate-400 mb-4 text-2xl">🔍</div>
            <h3 class="text-lg font-bold text-slate-800 mb-1">No products found</h3>
            <p class="text-slate-500 text-sm max-w-sm mx-auto mb-4">Try checking your spelling or selecting another category.</p>
            <button type="button" onclick="resetFilters()" class="text-brand-500 hover:text-brand-600 font-semibold text-sm">Reset Filters</button>
        </div>
    </main>

    <!-- Cart Overlay & Slide Drawer -->
    <div id="cartBackdrop" class="fixed inset-0 bg-slate-900/40 backdrop-blur-sm z-50 opacity-0 pointer-events-none transition-opacity duration-300" onclick="toggleCart(false)"></div>
    <div id="cartDrawer" class="fixed top-0 right-0 h-full w-full sm:w-[420px] bg-white z-50 shadow-2xl flex flex-col translate-x-full transition-transform duration-300 ease-out" role="dialog" aria-modal="true" aria-labelledby="cartTitle">
        <!-- Drawer Header -->
        <div class="p-5 border-b border-slate-100 flex items-center justify-between">
            <div class="flex items-center gap-2">
                <h2 id="cartTitle" class="text-lg font-bold text-slate-900">Your Cart</h2>
                <span id="cartDrawerBadge" class="bg-slate-100 text-slate-600 text-xs font-semibold px-2 py-0.5 rounded-full">0 items</span>
            </div>
            <button 
                type="button" 
                id="closeCart" 
                aria-label="Close cart drawer" 
                title="Close Cart"
                class="p-2 rounded-full text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors"
                onclick="toggleCart(false)"
            >
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>
        </div>

        <!-- Free shipping progress bar -->
        <div class="bg-brand-50/70 p-4 border-b border-brand-100/50">
            <div class="flex justify-between items-center text-xs font-medium mb-1.5 text-slate-700">
                <span id="shippingProgressText">Add items to unlock free shipping</span>
                <span id="shippingGoal" class="font-bold text-brand-600">$150.00 Goal</span>
            </div>
            <div class="w-full bg-slate-200/80 rounded-full h-1.5 overflow-hidden">
                <div id="shippingProgressBar" class="bg-brand-500 h-1.5 rounded-full transition-all duration-500" style="width: 0%"></div>
            </div>
        </div>

        <!-- Cart Items List -->
        <div class="flex-1 overflow-y-auto p-5 space-y-4 custom-scroll" id="cartItems">
            <!-- Dynamic Cart Items injected here -->
        </div>

        <!-- Drawer Footer -->
        <div class="p-5 border-t border-slate-100 bg-slate-50/60 space-y-3">
            <!-- Promo code input (Fixed input accessibility) -->
            <div class="flex gap-2">
                <label for="promoCodeInput" class="sr-only">Discount or Promo Code</label>
                <input 
                    type="text" 
                    id="promoCodeInput" 
                    name="promo"
                    aria-label="Enter promo code"
                    placeholder="Enter promo code (AURA20)" 
                    class="flex-1 bg-white border border-slate-200 text-xs px-3 py-2 rounded-xl uppercase tracking-wider font-medium focus:outline-none focus:border-brand-500"
                />
                <button type="button" onclick="applyPromo()" class="bg-slate-900 text-white text-xs font-semibold px-4 py-2 rounded-xl hover:bg-slate-800 transition-colors">Apply</button>
            </div>

            <!-- Pricing Breakdown -->
            <div class="space-y-1.5 pt-2 text-sm">
                <div class="flex justify-between text-slate-500">
                    <span>Subtotal</span>
                    <span id="cartSubtotal" class="font-medium text-slate-800">$0.00</span>
                </div>
                <div id="discountRow" class="hidden flex justify-between text-emerald-600">
                    <span>Discount (20%)</span>
                    <span id="cartDiscount" class="font-medium">-$0.00</span>
                </div>
                <div class="flex justify-between text-slate-500">
                    <span>Estimated Shipping</span>
                    <span id="cartShipping" class="font-medium text-slate-800">$0.00</span>
                </div>
                <div class="flex justify-between text-base font-bold text-slate-900 pt-2 border-t border-slate-200">
                    <span>Total</span>
                    <span id="cartTotal">$0.00</span>
                </div>
            </div>

            <button type="button" onclick="handleCheckout()" class="w-full bg-brand-500 hover:bg-brand-600 text-white font-semibold py-3.5 rounded-xl shadow-lg shadow-brand-500/25 transition-all active:scale-[0.99] flex items-center justify-center gap-2">
                <span>Proceed to Checkout</span>
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
            </button>
        </div>
    </div>

    <!-- Notification Toast -->
    <div id="toast" class="fixed bottom-6 right-6 z-50 bg-slate-900 text-white text-sm font-medium px-4 py-3 rounded-2xl shadow-xl flex items-center gap-3 transform translate-y-20 opacity-0 transition-all duration-300 pointer-events-none">
        <span class="w-2 h-2 rounded-full bg-emerald-400"></span>
        <span id="toastMsg">Added to bag</span>
    </div>

    <!-- JavaScript Application Logic -->
    <script>
        const products = [
            { id: 1, title: 'Wireless Active Headphones', category: 'electronics', price: 129.99, image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80', badge: 'Best Seller' },
            { id: 2, title: 'Minimalist Chrono Watch', category: 'lifestyle', price: 89.00, image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80', badge: 'Trending' },
            { id: 3, title: 'Ergonomic Studio Lamp', category: 'lifestyle', price: 45.50, image: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?auto=format&fit=crop&w=600&q=80' },
            { id: 4, title: 'Heavyweight Cotton Hoodie', category: 'apparel', price: 59.99, image: 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&w=600&q=80', badge: 'New' },
            { id: 5, title: 'Mechanical Tactile Keyboard', category: 'electronics', price: 109.00, image: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=600&q=80' },
            { id: 6, title: 'Heritage Leather Backpack', category: 'apparel', price: 140.00, image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=600&q=80' }
        ];

        let cart = [];
        let currentCategory = 'all';
        let searchQuery = '';
        let sortOption = 'default';
        let discountPercent = 0;
        const FREE_SHIPPING_THRESHOLD = 150.00;

        // DOM Elements
        const productGrid = document.getElementById('productGrid');
        const noResults = document.getElementById('noResults');
        const cartDrawer = document.getElementById('cartDrawer');
        const cartBackdrop = document.getElementById('cartBackdrop');
        const cartBtn = document.getElementById('cartBtn');
        const cartCount = document.getElementById('cartCount');
        const cartDrawerBadge = document.getElementById('cartDrawerBadge');
        const cartItems = document.getElementById('cartItems');
        const cartSubtotal = document.getElementById('cartSubtotal');
        const cartDiscount = document.getElementById('cartDiscount');
        const discountRow = document.getElementById('discountRow');
        const cartShipping = document.getElementById('cartShipping');
        const cartTotal = document.getElementById('cartTotal');
        const shippingProgressBar = document.getElementById('shippingProgressBar');
        const shippingProgressText = document.getElementById('shippingProgressText');
        const toast = document.getElementById('toast');
        const toastMsg = document.getElementById('toastMsg');
        const searchInput = document.getElementById('searchInput');
        const mobileSearchInput = document.getElementById('mobileSearchInput');
        const clearSearchBtn = document.getElementById('clearSearch');

        // Render Catalog Grid
        function getFilteredProducts() {
            return products
                .filter(p => currentCategory === 'all' || p.category === currentCategory)
                .filter(p => p.title.toLowerCase().includes(searchQuery.toLowerCase()))
                .sort((a, b) => {
                    if (sortOption === 'price-low') return a.price - b.price;
                    if (sortOption === 'price-high') return b.price - a.price;
                    if (sortOption === 'name') return a.title.localeCompare(b.title);
                    return a.id - b.id;
                });
        }

        function renderProducts() {
            const list = getFilteredProducts();
            if (list.length === 0) {
                productGrid.innerHTML = '';
                noResults.classList.remove('hidden');
                return;
            }

            noResults.classList.add('hidden');
            productGrid.innerHTML = list.map(item => `
                <div class="group bg-white rounded-2xl border border-slate-200/80 overflow-hidden shadow-sm hover:shadow-xl hover:border-slate-300 transition-all duration-300 flex flex-col">
                    <!-- Image Wrapper -->
                    <div class="relative overflow-hidden bg-slate-100 aspect-square">
                        <img 
                            src="${item.image}" 
                            alt="${item.title}" 
                            class="w-full h-full object-cover object-center group-hover:scale-105 transition-transform duration-500 ease-out"
                            loading="lazy"
                        />
                        ${item.badge ? `
                            <span class="absolute top-3 left-3 bg-slate-900/90 backdrop-blur text-white text-[11px] font-semibold px-2.5 py-1 rounded-full uppercase tracking-wider">
                                ${item.badge}
                            </span>
                        ` : ''}
                    </div>

                    <!-- Details -->
                    <div class="p-5 flex-1 flex flex-col justify-between">
                        <div>
                            <span class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-1.5 block">${item.category}</span>
                            <h3 class="text-base font-bold text-slate-800 group-hover:text-brand-500 transition-colors line-clamp-1">${item.title}</h3>
                        </div>

                        <div class="mt-4 pt-4 border-t border-slate-100 flex items-center justify-between">
                            <div>
                                <span class="text-xs text-slate-400 block">Price</span>
                                <span class="text-lg font-extrabold text-slate-900">$${item.price.toFixed(2)}</span>
                            </div>
                            <button 
                                type="button"
                                aria-label="Add ${item.title} to Cart" 
                                onclick="addToCart(${item.id})"
                                class="inline-flex items-center gap-1.5 bg-slate-900 hover:bg-brand-500 active:scale-95 text-white text-xs font-semibold px-4 py-2.5 rounded-xl transition-all shadow-sm"
                            >
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                                Add
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // Cart Drawer Operations
        function toggleCart(open) {
            if (open) {
                cartDrawer.classList.remove('translate-x-full');
                cartBackdrop.classList.remove('opacity-0', 'pointer-events-none');
            } else {
                cartDrawer.classList.add('translate-x-full');
                cartBackdrop.classList.add('opacity-0', 'pointer-events-none');
            }
        }

        cartBtn.addEventListener('click', () => toggleCart(true));

        function addToCart(productId) {
            const product = products.find(p => p.id === productId);
            const found = cart.find(item => item.id === productId);

            if (found) {
                found.quantity += 1;
            } else {
                cart.push({ ...product, quantity: 1 });
            }

            updateCartUI();
            showToast(`Added "${product.title}" to cart`);
            toggleCart(true);
        }

        function updateQuantity(productId, delta) {
            const item = cart.find(p => p.id === productId);
            if (!item) return;

            item.quantity += delta;
            if (item.quantity <= 0) {
                cart = cart.filter(p => p.id !== productId);
            }
            updateCartUI();
        }

        function removeFromCart(productId) {
            cart = cart.filter(p => p.id !== productId);
            updateCartUI();
        }

        function updateCartUI() {
            const totalCount = cart.reduce((sum, item) => sum + item.quantity, 0);
            cartCount.textContent = totalCount;
            cartDrawerBadge.textContent = `${totalCount} item${totalCount === 1 ? '' : 's'}`;

            if (cart.length === 0) {
                cartItems.innerHTML = `
                    <div class="h-64 flex flex-col items-center justify-center text-center">
                        <div class="w-14 h-14 rounded-2xl bg-slate-100 flex items-center justify-center text-slate-400 mb-3">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
                        </div>
                        <h4 class="font-bold text-slate-700 text-sm">Your cart is empty</h4>
                        <p class="text-xs text-slate-400 mt-1 max-w-[200px]">Explore our catalog and discover curated modern goods.</p>
                    </div>
                `;
            } else {
                cartItems.innerHTML = cart.map(item => `
                    <div class="flex items-center gap-3.5 bg-white p-3 rounded-2xl border border-slate-100 shadow-sm">
                        <img src="${item.image}" alt="${item.title}" class="w-16 h-16 rounded-xl object-cover bg-slate-100 flex-shrink-0" />
                        <div class="flex-1 min-w-0">
                            <h4 class="text-xs font-bold text-slate-900 truncate">${item.title}</h4>
                            <span class="text-xs text-slate-500 font-medium">$${item.price.toFixed(2)} each</span>
                            <div class="flex items-center gap-2 mt-2">
                                <div class="flex items-center border border-slate-200 rounded-lg bg-slate-50">
                                    <button 
                                        type="button"
                                        aria-label="Decrease quantity of ${item.title}" 
                                        onclick="updateQuantity(${item.id}, -1)" 
                                        class="px-2 py-0.5 text-slate-600 hover:text-slate-900 text-xs font-bold"
                                    >−</button>
                                    <span class="px-2 text-xs font-bold text-slate-800">${item.quantity}</span>
                                    <button 
                                        type="button"
                                        aria-label="Increase quantity of ${item.title}" 
                                        onclick="updateQuantity(${item.id}, 1)" 
                                        class="px-2 py-0.5 text-slate-600 hover:text-slate-900 text-xs font-bold"
                                    >+</button>
                                </div>
                                <button 
                                    type="button"
                                    aria-label="Remove ${item.title} from cart"
                                    onclick="removeFromCart(${item.id})" 
                                    class="text-[11px] text-red-500 hover:underline font-medium"
                                >Remove</button>
                            </div>
                        </div>
                        <span class="text-xs font-extrabold text-slate-900">$${(item.price * item.quantity).toFixed(2)}</span>
                    </div>
                `).join('');
            }

            // Financial Calculations
            const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            const discount = subtotal * discountPercent;
            const isFreeShipping = subtotal >= FREE_SHIPPING_THRESHOLD || subtotal === 0;
            const shipping = isFreeShipping ? 0 : 15.00;
            const total = Math.max(0, subtotal - discount + shipping);

            cartSubtotal.textContent = `$${subtotal.toFixed(2)}`;
            cartDiscount.textContent = `-$${discount.toFixed(2)}`;
            cartShipping.textContent = isFreeShipping ? 'FREE' : `$${shipping.toFixed(2)}`;
            cartTotal.textContent = `$${total.toFixed(2)}`;

            if (discountPercent > 0) {
                discountRow.classList.remove('hidden');
            } else {
                discountRow.classList.add('hidden');
            }

            // Shipping Progress
            const progress = Math.min(100, (subtotal / FREE_SHIPPING_THRESHOLD) * 100);
            shippingProgressBar.style.width = `${progress}%`;
            if (subtotal === 0) {
                shippingProgressText.textContent = `Add items to unlock free shipping`;
            } else if (subtotal >= FREE_SHIPPING_THRESHOLD) {
                shippingProgressText.textContent = `🎉 You've qualified for free shipping!`;
            } else {
                const diff = (FREE_SHIPPING_THRESHOLD - subtotal).toFixed(2);
                shippingProgressText.textContent = `Add $${diff} more for FREE shipping`;
            }
        }

        // Search & Filters
        function handleSearch(val) {
            searchQuery = val;
            if (searchInput.value !== val) searchInput.value = val;
            if (mobileSearchInput.value !== val) mobileSearchInput.value = val;

            if (val.trim()) {
                clearSearchBtn.classList.remove('hidden');
            } else {
                clearSearchBtn.classList.add('hidden');
            }
            renderProducts();
        }

        function clearSearchInput() {
            handleSearch('');
            searchInput.focus();
        }

        function filterProducts(cat, el) {
            currentCategory = cat;
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.className = 'filter-btn px-4 py-2 rounded-full text-xs sm:text-sm font-semibold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300';
            });
            el.className = 'filter-btn active px-4 py-2 rounded-full text-xs sm:text-sm font-semibold transition-all bg-brand-500 text-white shadow-sm';
            renderProducts();
        }

        function handleSort(val) {
            sortOption = val;
            renderProducts();
        }

        function resetFilters() {
            searchQuery = '';
            searchInput.value = '';
            mobileSearchInput.value = '';
            clearSearchBtn.classList.add('hidden');
            const defaultBtn = document.querySelector('.filter-btn');
            filterProducts('all', defaultBtn);
        }

        function applyPromo() {
            const input = document.getElementById('promoCodeInput');
            const code = input.value.trim().toUpperCase();
            if (code === 'AURA20') {
                discountPercent = 0.20;
                updateCartUI();
                showToast('20% Promo discount applied!');
                input.value = '';
            } else {
                showToast('Invalid promo code');
            }
        }

        function handleCheckout() {
            if (cart.length === 0) {
                showToast('Your cart is empty');
                return;
            }
            showToast('Redirecting to checkout...');
        }

        function showToast(text) {
            toastMsg.textContent = text;
            toast.classList.remove('opacity-0', 'translate-y-20', 'pointer-events-none');
            setTimeout(() => {
                toast.classList.add('opacity-0', 'translate-y-20', 'pointer-events-none');
            }, 2600);
        }

        // Initial Initialization
        renderProducts();
        updateCartUI();
    </script>
</body>
</html>
