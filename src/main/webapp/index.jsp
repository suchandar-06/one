<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aura Institute of Technology & Sciences | Modern Higher Education</title>
    <!-- Google Fonts & Tailwind CDN -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
                            50: '#eff6ff',
                            100: '#dbeafe',
                            200: '#bfdbfe',
                            500: '#2563eb',
                            600: '#1d4ed8',
                            700: '#1e40af',
                            800: '#1e3a8a',
                            900: '#0f172a',
                        },
                        accent: {
                            500: '#f59e0b',
                            600: '#d97706',
                        }
                    }
                }
            }
        }
    </script>
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: #f1f5f9;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 9999px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-800 font-sans min-h-screen flex flex-col selection:bg-brand-600 selection:text-white">

    <!-- Admissions Banner -->
    <aside aria-label="Admissions Alert" class="bg-slate-950 text-slate-200 text-xs py-2 px-4 border-b border-slate-800">
        <div class="max-w-7xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-2">
            <div class="flex items-center gap-2">
                <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-bold bg-amber-400/20 text-amber-300 border border-amber-400/30">
                    ADMISSIONS OPEN
                </span>
                <span>Fall 2026 Regular Applications are live. Early Decision merit grants available.</span>
            </div>
            <div class="flex items-center gap-4 text-xs font-semibold">
                <a href="#programs" class="text-brand-300 hover:text-white transition-colors">Browse Degrees</a>
                <span class="text-slate-600">•</span>
                <span class="text-slate-400">Campus Code: <strong class="text-white">AURA-EDU</strong></span>
            </div>
        </div>
    </aside>

    <!-- Main Navigation Bar -->
    <header class="sticky top-0 z-40 bg-white/90 backdrop-blur-md border-b border-slate-200/90 shadow-sm transition-all">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between gap-4">
            
            <!-- University Emblem and Brand -->
            <a href="#" class="flex items-center gap-3 group focus:outline-none focus:ring-2 focus:ring-brand-500 rounded-lg p-1">
                <div class="w-11 h-11 rounded-2xl bg-gradient-to-tr from-brand-700 via-brand-600 to-indigo-500 flex items-center justify-center text-white shadow-md shadow-brand-700/20 group-hover:scale-105 transition-transform">
                    <i data-lucide="graduation-cap" class="w-6 h-6"></i>
                </div>
                <div>
                    <span class="text-lg sm:text-xl font-extrabold tracking-tight text-slate-900 block leading-tight">
                        AURA TECH<span class="text-brand-600">.</span>
                    </span>
                    <span class="text-[10px] uppercase font-bold text-slate-400 tracking-wider">Institute of Technology & Sciences</span>
                </div>
            </a>

            <!-- Search Field (Fully WCAG/Sonar Compliant with Accessible Label) -->
            <div class="hidden lg:flex flex-1 max-w-sm mx-6">
                <div class="relative w-full">
                    <label for="catalogSearchInput" class="sr-only">Search academic programs, majors, or degrees</label>
                    <i data-lucide="search" class="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2 pointer-events-none"></i>
                    <input 
                        type="text" 
                        id="catalogSearchInput" 
                        name="catalogSearch"
                        aria-label="Search academic programs, majors, or degrees"
                        placeholder="Search majors, AI, Aerospace, Robotics..." 
                        class="w-full bg-slate-100 hover:bg-slate-50 focus:bg-white text-slate-800 text-xs pl-10 pr-9 py-2.5 rounded-full border border-slate-200 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition-all"
                        oninput="handleProgramSearch(this.value)"
                    >
                    <button 
                        type="button" 
                        id="clearSearchBtn" 
                        aria-label="Clear program search query" 
                        title="Clear search"
                        onclick="clearSearch()"
                        class="hidden absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 focus:outline-none"
                    >
                        <i data-lucide="x" class="w-3.5 h-3.5"></i>
                    </button>
                </div>
            </div>

            <!-- Header Action Elements -->
            <div class="flex items-center gap-3">
                <nav class="hidden md:flex items-center gap-5 text-sm font-semibold text-slate-600 mr-2">
                    <a href="#programs" class="hover:text-brand-600 transition-colors">Programs</a>
                    <a href="#research" class="hover:text-brand-600 transition-colors">Research</a>
                    <a href="#campus" class="hover:text-brand-600 transition-colors">Campus Life</a>
                    <a href="#events" class="hover:text-brand-600 transition-colors">Events</a>
                </nav>

                <!-- Saved Programs Shortlist Drawer Button -->
                <button 
                    type="button"
                    id="shortlistDrawerBtn"
                    aria-label="View shortlisted academic programs"
                    title="View shortlisted programs"
                    class="relative p-2.5 rounded-full bg-slate-100 hover:bg-slate-200 text-slate-700 active:scale-95 transition-all focus:outline-none focus:ring-2 focus:ring-brand-500"
                    onclick="toggleShortlistDrawer(true)"
                >
                    <i data-lucide="bookmark" class="w-5 h-5"></i>
                    <span id="shortlistBadge" class="absolute -top-1 -right-1 bg-brand-600 text-white font-extrabold text-[10px] w-5 h-5 rounded-full flex items-center justify-center shadow-sm">0</span>
                </button>

                <!-- Primary CTA Application Button -->
                <button 
                    type="button"
                    aria-label="Open undergraduate or graduate application form"
                    onclick="openInquiryModal()"
                    class="bg-brand-600 hover:bg-brand-700 text-white text-xs sm:text-sm font-bold px-4 sm:px-5 py-2.5 rounded-full shadow-md shadow-brand-600/25 active:scale-95 transition-all flex items-center gap-1.5 focus:outline-none focus:ring-2 focus:ring-brand-500"
                >
                    <i data-lucide="send" class="w-3.5 h-3.5"></i>
                    <span>Apply Now</span>
                </button>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="relative bg-slate-900 text-white py-16 sm:py-24 overflow-hidden border-b border-slate-800">
        <div class="absolute inset-0 opacity-25 bg-[radial-gradient(#3b82f6_1px,transparent_1px)] [background-size:24px_24px]"></div>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
                
                <div class="lg:col-span-7 space-y-6">
                    <div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold bg-brand-500/10 border border-brand-500/30 text-brand-300">
                        <i data-lucide="award" class="w-4 h-4 text-amber-400"></i> QS Ranked #1 Emerging Tech Institute
                    </div>
                    
                    <h1 class="text-4xl sm:text-5xl lg:text-6xl font-black tracking-tight leading-[1.1]">
                        Pioneering the Next Century of <span class="bg-gradient-to-r from-blue-400 to-indigo-300 bg-clip-text text-transparent">Science & Invention.</span>
                    </h1>

                    <p class="text-slate-300 text-base sm:text-lg max-w-xl font-normal leading-relaxed">
                        At Aura Tech, we cultivate quantum computing researchers, aerospace pioneers, bioengineers, and ethical technologists through immersive project-based pedagogy.
                    </p>

                    <div class="flex flex-wrap items-center gap-3 pt-2">
                        <a href="#programs" class="bg-brand-600 hover:bg-brand-500 text-white text-sm font-bold px-6 py-3.5 rounded-xl shadow-lg shadow-brand-600/30 active:scale-95 transition-all flex items-center gap-2">
                            <span>Explore 45+ Majors</span>
                            <i data-lucide="arrow-down" class="w-4 h-4"></i>
                        </a>
                        <button type="button" onclick="openTourModal()" class="bg-slate-800 hover:bg-slate-700 text-slate-200 text-sm font-semibold px-5 py-3.5 rounded-xl border border-slate-700 flex items-center gap-2 transition-all">
                            <i data-lucide="play-circle" class="w-4 h-4 text-amber-400"></i>
                            <span>Virtual Campus Tour</span>
                        </button>
                    </div>

                    <!-- Verified Trust Badges -->
                    <div class="pt-4 flex items-center gap-6 text-xs text-slate-400 font-medium">
                        <span class="flex items-center gap-1.5"><i data-lucide="shield-check" class="w-4 h-4 text-emerald-400"></i> ABET Accredited</span>
                        <span class="flex items-center gap-1.5"><i data-lucide="check-circle" class="w-4 h-4 text-emerald-400"></i> Carnegie Tier 1 Research</span>
                        <span class="flex items-center gap-1.5"><i data-lucide="globe" class="w-4 h-4 text-emerald-400"></i> 64 Global Alliances</span>
                    </div>
                </div>

                <!-- Campus Visual Card -->
                <div class="lg:col-span-5 relative">
                    <div class="relative rounded-3xl overflow-hidden border border-slate-700/80 shadow-2xl group">
                        <img 
                            src="https://images.unsplash.com/photo-1541829070764-84a7d30dd3f3?auto=format&fit=crop&w=900&q=80" 
                            alt="Aura Institute campus architectural glass pavilion and students" 
                            class="w-full h-96 object-cover object-center group-hover:scale-105 transition-transform duration-700 ease-out"
                        >
                        <div class="absolute inset-0 bg-gradient-to-t from-slate-950 via-slate-900/30 to-transparent"></div>
                        <div class="absolute bottom-6 left-6 right-6">
                            <div class="flex items-center justify-between text-xs text-brand-300 font-semibold mb-1">
                                <span>CENTENNIAL RESEARCH PARK</span>
                                <span class="bg-emerald-500/20 text-emerald-300 px-2 py-0.5 rounded border border-emerald-500/30">Active Labs</span>
                            </div>
                            <p class="text-white text-sm font-bold">Center for Autonomous Systems & High-Energy Materials</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Key Institutional Stats Grid -->
            <div class="mt-14 pt-10 border-t border-slate-800 grid grid-cols-2 md:grid-cols-4 gap-6">
                <div>
                    <span class="text-3xl sm:text-4xl font-black text-white block">98.4%</span>
                    <span class="text-xs uppercase font-semibold text-slate-400 tracking-wider">Placement within 6 Months</span>
                </div>
                <div>
                    <span class="text-3xl sm:text-4xl font-black text-white block">$148K</span>
                    <span class="text-xs uppercase font-semibold text-slate-400 tracking-wider">Average Graduate Starting Comp</span>
                </div>
                <div>
                    <span class="text-3xl sm:text-4xl font-black text-white block">240+</span>
                    <span class="text-xs uppercase font-semibold text-slate-400 tracking-wider">High-Tech Research Facilities</span>
                </div>
                <div>
                    <span class="text-3xl sm:text-4xl font-black text-white block">12:1</span>
                    <span class="text-xs uppercase font-semibold text-slate-400 tracking-wider">Student-to-Faculty Ratio</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Academic Program Finder Section -->
    <section id="programs" class="py-16 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-8">
            <div>
                <span class="text-xs font-bold uppercase tracking-wider text-brand-600 block mb-1">Degree Directory</span>
                <h2 class="text-3xl font-extrabold text-slate-900 tracking-tight">Undergraduate & Graduate Programs</h2>
                <p class="text-slate-500 text-sm mt-1">Select degree levels and fields of inquiry to discover curricula, credit requirements, and estimated tuition.</p>
            </div>
            
            <!-- Sort dropdown with accessible label -->
            <div class="flex items-center gap-2 self-start md:self-auto">
                <label for="programSortSelect" class="text-xs font-bold uppercase tracking-wider text-slate-400 whitespace-nowrap">Sort By:</label>
                <div class="relative">
                    <select 
                        id="programSortSelect" 
                        name="programSort"
                        aria-label="Sort academic programs" 
                        onchange="handleProgramSort(this.value)"
                        class="bg-white border border-slate-200 text-slate-800 text-xs sm:text-sm font-medium rounded-xl pl-3 pr-8 py-2 focus:outline-none focus:border-brand-500 cursor-pointer shadow-sm"
                    >
                        <option value="featured">Featured First</option>
                        <option value="duration">Duration (Shortest)</option>
                        <option value="tuition-low">Tuition Credit: Low to High</option>
                        <option value="tuition-high">Tuition Credit: High to Low</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Filter Controls (Degree Level + Field) -->
        <div class="flex flex-wrap items-center gap-2 pb-6 border-b border-slate-200">
            <button type="button" class="degree-filter active px-4 py-2 rounded-full text-xs font-bold transition-all bg-slate-900 text-white" onclick="filterDegree('all', this)">All Degrees</button>
            <button type="button" class="degree-filter px-4 py-2 rounded-full text-xs font-bold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterDegree('Undergraduate', this)">B.S. Undergraduate</button>
            <button type="button" class="degree-filter px-4 py-2 rounded-full text-xs font-bold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterDegree('Postgraduate', this)">M.S. Master's</button>
            <button type="button" class="degree-filter px-4 py-2 rounded-full text-xs font-bold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterDegree('Doctorate', this)">Ph.D. Doctoral</button>
            <button type="button" class="degree-filter px-4 py-2 rounded-full text-xs font-bold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300" onclick="filterDegree('Certificate', this)">Executive Certificates</button>
        </div>

        <!-- Program Cards Grid -->
        <div id="programsGrid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8 mt-8">
            <!-- Dynamically populated via JavaScript -->
        </div>

        <!-- Empty State Filter Feedback -->
        <div id="noProgramsFound" class="hidden text-center py-20 bg-white rounded-3xl border border-slate-200 p-8 mt-8">
            <div class="w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center mx-auto mb-3 text-slate-400">
                <i data-lucide="book-open" class="w-8 h-8"></i>
            </div>
            <h3 class="text-base font-bold text-slate-800">No matching degree programs found</h3>
            <p class="text-xs text-slate-500 max-w-sm mx-auto mt-1 mb-4">Try revising your search keyword or clearing the active degree filter.</p>
            <button type="button" onclick="resetProgramFilters()" class="text-xs font-bold text-brand-600 hover:underline">Reset Catalog Filters</button>
        </div>
    </section>

    <!-- Research Breakthroughs Highlight -->
    <section id="research" class="py-16 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row justify-between items-start md:items-end gap-4 mb-12">
                <div>
                    <span class="text-xs font-bold uppercase tracking-wider text-brand-400 block mb-1">Discovery & Patents</span>
                    <h2 class="text-3xl font-black tracking-tight">Institutional Research Labs</h2>
                    <p class="text-slate-400 text-sm mt-1">Cross-disciplinary institutes funded by National Science Foundation grants and industry ventures.</p>
                </div>
                <button type="button" onclick="openInquiryModal('Research Fellowship')" class="text-xs font-bold bg-slate-800 hover:bg-slate-700 px-4 py-2.5 rounded-xl border border-slate-700 text-slate-200 transition-colors">
                    Apply for Research Fellowships
                </button>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="bg-slate-800/60 border border-slate-700/70 p-6 rounded-2xl flex flex-col justify-between hover:border-brand-500/50 transition-all">
                    <div>
                        <div class="w-10 h-10 rounded-xl bg-brand-500/10 text-brand-400 flex items-center justify-center mb-4">
                            <i data-lucide="cpu" class="w-5 h-5"></i>
                        </div>
                        <h3 class="font-bold text-lg mb-2">Quantum & Photonic Devices</h3>
                        <p class="text-slate-400 text-xs leading-relaxed">Developing fault-tolerant room-temperature optical lattices and quantum key encryption hardware for satellite downlinks.</p>
                    </div>
                    <div class="mt-6 pt-4 border-t border-slate-700/50 flex justify-between text-xs text-slate-400">
                        <span>Lead: Dr. Evelyn Vance</span>
                        <strong class="text-brand-300">42 Patents</strong>
                    </div>
                </div>

                <div class="bg-slate-800/60 border border-slate-700/70 p-6 rounded-2xl flex flex-col justify-between hover:border-brand-500/50 transition-all">
                    <div>
                        <div class="w-10 h-10 rounded-xl bg-emerald-500/10 text-emerald-400 flex items-center justify-center mb-4">
                            <i data-lucide="dna" class="w-5 h-5"></i>
                        </div>
                        <h3 class="font-bold text-lg mb-2">Synthetic Biology & Neural Probes</h3>
                        <p class="text-slate-400 text-xs leading-relaxed">Engineered enzymatic carbon capture alongside ultra-low-power biocompatible electrode arrays for spinal restoration.</p>
                    </div>
                    <div class="mt-6 pt-4 border-t border-slate-700/50 flex justify-between text-xs text-slate-400">
                        <span>Lead: Prof. Kenji Sato</span>
                        <strong class="text-emerald-300">$18M Grant Pool</strong>
                    </div>
                </div>

                <div class="bg-slate-800/60 border border-slate-700/70 p-6 rounded-2xl flex flex-col justify-between hover:border-brand-500/50 transition-all">
                    <div>
                        <div class="w-10 h-10 rounded-xl bg-amber-500/10 text-amber-400 flex items-center justify-center mb-4">
                            <i data-lucide="rocket" class="w-5 h-5"></i>
                        </div>
                        <h3 class="font-bold text-lg mb-2">Aerospace Propulsion Systems</h3>
                        <p class="text-slate-400 text-xs leading-relaxed">Designing aerospike rocket engines with 3D-printed inconel chambers and autonomous atmospheric reentry glide algorithms.</p>
                    </div>
                    <div class="mt-6 pt-4 border-t border-slate-700/50 flex justify-between text-xs text-slate-400">
                        <span>Lead: Dr. Marcus Thorne</span>
                        <strong class="text-amber-300">NASA Co-op</strong>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Campus Life & Upcoming Events -->
    <section id="events" class="py-16 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-10">
            <!-- Events List -->
            <div class="lg:col-span-7">
                <span class="text-xs font-bold uppercase tracking-wider text-brand-600 block mb-1">Calendar & Lectures</span>
                <h2 class="text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight mb-6">Upcoming Campus Events</h2>
                
                <div class="space-y-4">
                    <div class="p-4 bg-white rounded-2xl border border-slate-200/80 shadow-sm flex items-start gap-4 hover:border-slate-300 transition-colors">
                        <div class="bg-brand-50 text-brand-700 rounded-xl p-3 text-center min-w-[64px]">
                            <span class="block text-xs uppercase font-extrabold">OCT</span>
                            <span class="block text-xl font-black">14</span>
                        </div>
                        <div class="flex-1">
                            <span class="text-[11px] font-bold text-brand-600 uppercase">Keynote Symposium</span>
                            <h3 class="font-bold text-slate-900 text-sm sm:text-base">Autonomous Robotics & Ethics in Aerospace</h3>
                            <p class="text-xs text-slate-500 mt-1">Speaker: Dr. Ellen Park (Head of Jet Propulsion Dynamics, Caltech). Grand Auditorium.</p>
                        </div>
                        <button type="button" onclick="showToast('Registered for Dr. Park Keynote')" class="text-xs font-bold text-slate-700 hover:text-brand-600 bg-slate-50 hover:bg-slate-100 px-3 py-2 rounded-lg transition-colors">
                            RSVP
                        </button>
                    </div>

                    <div class="p-4 bg-white rounded-2xl border border-slate-200/80 shadow-sm flex items-start gap-4 hover:border-slate-300 transition-colors">
                        <div class="bg-amber-50 text-amber-700 rounded-xl p-3 text-center min-w-[64px]">
                            <span class="block text-xs uppercase font-extrabold">NOV</span>
                            <span class="block text-xl font-black">02</span>
                        </div>
                        <div class="flex-1">
                            <span class="text-[11px] font-bold text-amber-600 uppercase">Hackathon</span>
                            <h3 class="font-bold text-slate-900 text-sm sm:text-base">Aura Global AI & Quantum Hackathon 2026</h3>
                            <p class="text-xs text-slate-500 mt-1">48-hour sprint sponsored by Google DeepMind, OpenAI, & NVIDIA. $50,000 in seed prizes.</p>
                        </div>
                        <button type="button" onclick="showToast('Registered team for Hackathon 2026')" class="text-xs font-bold text-slate-700 hover:text-brand-600 bg-slate-50 hover:bg-slate-100 px-3 py-2 rounded-lg transition-colors">
                            Register
                        </button>
                    </div>

                    <div class="p-4 bg-white rounded-2xl border border-slate-200/80 shadow-sm flex items-start gap-4 hover:border-slate-300 transition-colors">
                        <div class="bg-emerald-50 text-emerald-700 rounded-xl p-3 text-center min-w-[64px]">
                            <span class="block text-xs uppercase font-extrabold">NOV</span>
                            <span class="block text-xl font-black">19</span>
                        </div>
                        <div class="flex-1">
                            <span class="text-[11px] font-bold text-emerald-600 uppercase">Admissions Open House</span>
                            <h3 class="font-bold text-slate-900 text-sm sm:text-base">Fall 2027 Prospective Student Visitation Day</h3>
                            <p class="text-xs text-slate-500 mt-1">Lab tours, dorm walkthroughs, and one-on-one sessions with department chairpersons.</p>
                        </div>
                        <button type="button" onclick="showToast('Booked Open House Pass')" class="text-xs font-bold text-slate-700 hover:text-brand-600 bg-slate-50 hover:bg-slate-100 px-3 py-2 rounded-lg transition-colors">
                            Book Pass
                        </button>
                    </div>
                </div>
            </div>

            <!-- Campus Life Features -->
            <div id="campus" class="lg:col-span-5 bg-gradient-to-br from-brand-700 to-indigo-900 text-white rounded-3xl p-6 sm:p-8 flex flex-col justify-between shadow-xl">
                <div>
                    <span class="text-xs font-bold uppercase tracking-wider text-brand-200">Residential Life & Culture</span>
                    <h3 class="text-2xl font-black mt-1 mb-4 leading-snug">Vibrant, Diverse Campus Ecosystem</h3>
                    <p class="text-brand-100 text-xs sm:text-sm leading-relaxed mb-6">
                        Located on 320 wooded acres with carbon-neutral residences, olympic aquatic facilities, maker studios, and over 120 student-run organizations.
                    </p>
                    
                    <ul class="space-y-3 text-xs sm:text-sm">
                        <li class="flex items-center gap-2.5">
                            <i data-lucide="check" class="w-4 h-4 text-emerald-400"></i>
                            <span>100% Guaranteed 4-Year Student Housing</span>
                        </li>
                        <li class="flex items-center gap-2.5">
                            <i data-lucide="check" class="w-4 h-4 text-emerald-400"></i>
                            <span>24/7 Supercomputer Cluster Access</span>
                        </li>
                        <li class="flex items-center gap-2.5">
                            <i data-lucide="check" class="w-4 h-4 text-emerald-400"></i>
                            <span>Venture Incubator ($2.5M Seed Allocation)</span>
                        </li>
                    </ul>
                </div>

                <div class="pt-8 border-t border-brand-500/40 flex items-center justify-between">
                    <div>
                        <span class="text-xs text-brand-200 block">Questions about Student Life?</span>
                        <span class="font-bold text-sm">admissions@aura-tech.edu</span>
                    </div>
                    <button type="button" onclick="openTourModal()" class="bg-white text-brand-800 text-xs font-bold px-4 py-2.5 rounded-xl hover:bg-brand-50 transition-colors">
                        View Campus Map
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- Backdrop Overlay -->
    <div id="drawerBackdrop" class="fixed inset-0 bg-slate-950/50 backdrop-blur-sm z-50 opacity-0 pointer-events-none transition-opacity duration-300" onclick="toggleShortlistDrawer(false)"></div>

    <!-- Application Shortlist Drawer -->
    <aside id="shortlistDrawer" class="fixed top-0 right-0 h-full w-full sm:w-[450px] bg-white z-50 shadow-2xl flex flex-col translate-x-full transition-transform duration-300 ease-out" role="dialog" aria-modal="true" aria-labelledby="shortlistDrawerTitle">
        <!-- Drawer Header -->
        <div class="p-5 border-b border-slate-100 flex items-center justify-between bg-slate-50/70">
            <div class="flex items-center gap-2">
                <i data-lucide="bookmark-check" class="w-5 h-5 text-brand-600"></i>
                <h2 id="shortlistDrawerTitle" class="text-base font-bold text-slate-900">Program Shortlist</h2>
                <span id="shortlistDrawerCount" class="bg-brand-100 text-brand-800 text-xs font-extrabold px-2 py-0.5 rounded-full">0 selected</span>
            </div>
            <button 
                type="button" 
                aria-label="Close program shortlist drawer" 
                title="Close drawer"
                onclick="toggleShortlistDrawer(false)"
                class="p-2 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-200/60 transition-colors"
            >
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
        </div>

        <!-- Academic Advisor Progress Banner -->
        <div class="bg-indigo-50/70 p-4 border-b border-indigo-100/70 text-xs">
            <div class="flex justify-between font-semibold text-slate-700 mb-1">
                <span id="creditTrackingText">Shortlist programs to calculate credit fees</span>
                <span id="shortlistProgressLabel" class="text-brand-700 font-extrabold">0 Credits</span>
            </div>
            <div class="w-full bg-indigo-200/60 rounded-full h-1.5 overflow-hidden">
                <div id="shortlistCreditBar" class="bg-brand-600 h-1.5 rounded-full transition-all duration-300" style="width: 0%"></div>
            </div>
        </div>

        <!-- Shortlisted Programs List -->
        <div id="shortlistItemsContainer" class="flex-1 overflow-y-auto p-5 space-y-3 custom-scrollbar">
            <!-- Dynamic elements will be injected here -->
        </div>

        <!-- Financial & Scholarship Evaluation Footer -->
        <div class="p-5 border-t border-slate-200 bg-slate-50 space-y-3">
            <!-- Merit / Fellowship Code with Accessible Label -->
            <div>
                <label for="meritGrantInput" class="sr-only">Scholarship or Merit Fee Waiver Code</label>
                <div class="flex gap-2">
                    <input 
                        type="text" 
                        id="meritGrantInput" 
                        name="meritGrant"
                        aria-label="Scholarship or Merit Fee Waiver Code"
                        placeholder="Merit / Waiver Code (e.g. AURA20)" 
                        class="flex-1 bg-white border border-slate-200 text-xs px-3 py-2 rounded-xl uppercase font-semibold text-slate-800 focus:outline-none focus:border-brand-500"
                    />
                    <button type="button" onclick="applyMeritCode()" class="bg-slate-900 hover:bg-slate-800 text-white text-xs font-bold px-4 py-2 rounded-xl transition-colors">
                        Apply
                    </button>
                </div>
            </div>

            <div id="meritGrantFeedback" class="hidden text-xs font-semibold text-emerald-600"></div>

            <!-- Cost Summary Breakdown -->
            <div class="space-y-1.5 pt-2 text-xs">
                <div class="flex justify-between text-slate-500">
                    <span>Estimated Credit Tuition</span>
                    <span id="shortlistTuitionSubtotal" class="font-bold text-slate-800">$0.00</span>
                </div>
                <div id="meritGrantRow" class="hidden flex justify-between text-emerald-600">
                    <span>Merit Fellowship Discount (20%)</span>
                    <span id="shortlistGrantAmount" class="font-bold">-$0.00</span>
                </div>
                <div class="flex justify-between text-slate-500">
                    <span>Campus Technology & Lab Fees</span>
                    <span id="shortlistLabFee" class="font-bold text-slate-800">$0.00</span>
                </div>
                <div class="flex justify-between text-sm font-extrabold text-slate-900 pt-2 border-t border-slate-200">
                    <span>Estimated Total Per Semester</span>
                    <span id="shortlistGrandTotal">$0.00</span>
                </div>
            </div>

            <!-- Action CTA -->
            <button 
                type="button" 
                onclick="submitShortlistApplication()" 
                class="w-full bg-brand-600 hover:bg-brand-700 text-white font-bold py-3 px-4 rounded-xl shadow-lg shadow-brand-600/20 active:scale-98 transition-all flex items-center justify-center gap-2 text-xs sm:text-sm"
            >
                <i data-lucide="check-square" class="w-4 h-4"></i>
                <span>Complete Application for Shortlisted Degrees</span>
            </button>
        </div>
    </aside>

    <!-- Application Inquiry Modal (WCAG / Sonar Compliant Form) -->
    <div id="inquiryModal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/60 backdrop-blur-sm opacity-0 pointer-events-none transition-all duration-200" role="dialog" aria-modal="true" aria-labelledby="inquiryModalTitle">
        <div class="bg-white rounded-3xl max-w-lg w-full p-6 sm:p-8 shadow-2xl relative">
            <button 
                type="button" 
                id="closeInquiryBtn" 
                aria-label="Close application inquiry modal" 
                title="Close"
                onclick="closeInquiryModal()" 
                class="absolute top-5 right-5 text-slate-400 hover:text-slate-700 p-2 rounded-full hover:bg-slate-100 transition-colors"
            >
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>

            <div class="mb-5">
                <span class="text-xs uppercase font-extrabold tracking-wider text-brand-600">Admissions Portal</span>
                <h3 id="inquiryModalTitle" class="text-2xl font-black text-slate-900 mt-0.5">Start Your Journey at Aura</h3>
                <p class="text-xs text-slate-500 mt-1">Submit your preliminary credentials for admissions pre-screening and faculty review.</p>
            </div>

            <form id="admissionsInquiryForm" onsubmit="handleInquirySubmission(event)" class="space-y-4">
                <div>
                    <label for="applicantFullName" class="block text-xs font-bold text-slate-700 mb-1">Full Legal Name *</label>
                    <input 
                        type="text" 
                        id="applicantFullName" 
                        name="fullName"
                        required 
                        aria-label="Applicant Full Legal Name"
                        placeholder="e.g. Katherine Vance" 
                        class="w-full bg-slate-50 border border-slate-200 text-xs px-3.5 py-2.5 rounded-xl focus:outline-none focus:border-brand-500 text-slate-800"
                    />
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <div>
                        <label for="applicantEmail" class="block text-xs font-bold text-slate-700 mb-1">Email Address *</label>
                        <input 
                            type="email" 
                            id="applicantEmail" 
                            name="email"
                            required 
                            aria-label="Applicant Email Address"
                            placeholder="k.vance@example.com" 
                            class="w-full bg-slate-50 border border-slate-200 text-xs px-3.5 py-2.5 rounded-xl focus:outline-none focus:border-brand-500 text-slate-800"
                        />
                    </div>
                    <div>
                        <label for="applicantGpa" class="block text-xs font-bold text-slate-700 mb-1">Current GPA / Grade *</label>
                        <input 
                            type="text" 
                            id="applicantGpa" 
                            name="gpa"
                            required 
                            aria-label="Applicant Current Grade Point Average"
                            placeholder="e.g. 3.9 / 4.0" 
                            class="w-full bg-slate-50 border border-slate-200 text-xs px-3.5 py-2.5 rounded-xl focus:outline-none focus:border-brand-500 text-slate-800"
                        />
                    </div>
                </div>

                <div>
                    <label for="preferredProgramSelect" class="block text-xs font-bold text-slate-700 mb-1">Program of Primary Interest *</label>
                    <select 
                        id="preferredProgramSelect" 
                        name="preferredProgram"
                        aria-label="Preferred Academic Degree Program"
                        class="w-full bg-slate-50 border border-slate-200 text-xs px-3.5 py-2.5 rounded-xl focus:outline-none focus:border-brand-500 text-slate-800 cursor-pointer"
                    >
                        <option value="B.S. Artificial Intelligence & Neural Systems">B.S. Artificial Intelligence & Neural Systems</option>
                        <option value="B.S. Aerospace & Astronautical Engineering">B.S. Aerospace & Astronautical Engineering</option>
                        <option value="M.S. Quantum Informatics & Nanomaterials">M.S. Quantum Informatics & Nanomaterials</option>
                        <option value="Ph.D. Bioengineering & Synthetic Genetics">Ph.D. Bioengineering & Synthetic Genetics</option>
                        <option value="B.S. Cyber-Physical Security & Cryptography">B.S. Cyber-Physical Security & Cryptography</option>
                    </select>
                </div>

                <div>
                    <label for="statementOfPurpose" class="block text-xs font-bold text-slate-700 mb-1">Research Interests or Brief Statement (Optional)</label>
                    <textarea 
                        id="statementOfPurpose" 
                        name="statement"
                        rows="3" 
                        aria-label="Brief statement of purpose or research interests"
                        placeholder="Tell the committee about your projects, publications, or career objectives..."
                        class="w-full bg-slate-50 border border-slate-200 text-xs p-3 rounded-xl focus:outline-none focus:border-brand-500 text-slate-800"
                    ></textarea>
                </div>

                <div class="pt-2">
                    <button 
                        type="submit" 
                        class="w-full bg-brand-600 hover:bg-brand-700 text-white font-bold py-3 rounded-xl shadow-lg shadow-brand-600/25 active:scale-95 transition-all text-xs sm:text-sm"
                    >
                        Submit Admissions Package
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Virtual Tour Video Modal -->
    <div id="tourModal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/70 backdrop-blur-sm opacity-0 pointer-events-none transition-all duration-200" role="dialog" aria-modal="true" aria-labelledby="tourModalTitle">
        <div class="bg-slate-900 rounded-3xl max-w-2xl w-full p-6 border border-slate-800 text-white relative">
            <button 
                type="button" 
                aria-label="Close virtual tour modal" 
                title="Close"
                onclick="closeTourModal()" 
                class="absolute top-4 right-4 text-slate-400 hover:text-white p-2 rounded-full hover:bg-slate-800 transition-colors"
            >
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
            <div class="mb-4">
                <span class="text-xs uppercase font-bold text-amber-400">Virtual Reality Showcase</span>
                <h3 id="tourModalTitle" class="text-xl font-bold mt-1">Aura Tech 360° Interactive Campus</h3>
            </div>
            <div class="aspect-video bg-slate-950 rounded-2xl overflow-hidden relative border border-slate-800 flex items-center justify-center">
                <img 
                    src="https://images.unsplash.com/photo-1562774053-701939374585?auto=format&fit=crop&w=1000&q=80" 
                    alt="Panoramic view of academic halls and student quad" 
                    class="w-full h-full object-cover opacity-60"
                >
                <div class="absolute inset-0 flex flex-col items-center justify-center text-center p-4">
                    <div class="w-16 h-16 rounded-full bg-brand-600 text-white flex items-center justify-center mb-3 shadow-lg shadow-brand-600/50 hover:scale-110 transition-transform cursor-pointer" onclick="showToast('Loading 360° Virtual Campus Stream...')">
                        <i data-lucide="play" class="w-7 h-7 fill-white ml-1"></i>
                    </div>
                    <span class="text-xs font-semibold text-slate-300">Click to launch 8K interactive walkthrough</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Toast Notification Banner -->
    <div id="toastNotification" class="fixed bottom-6 right-6 z-50 bg-slate-900 text-white text-xs font-semibold px-4 py-3 rounded-2xl shadow-xl flex items-center gap-2.5 transform translate-y-20 opacity-0 transition-all duration-300 pointer-events-none border border-slate-700">
        <i data-lucide="check-circle-2" class="w-4 h-4 text-emerald-400"></i>
        <span id="toastMessageText">Action successful</span>
    </div>

    <!-- Comprehensive University Footer -->
    <footer class="bg-slate-950 text-slate-400 text-xs border-t border-slate-800 pt-16 pb-12 mt-auto">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-10 mb-12">
                
                <!-- University Branding -->
                <div class="lg:col-span-2 space-y-4">
                    <div class="flex items-center gap-2.5 text-white font-extrabold text-xl">
                        <div class="w-9 h-9 rounded-xl bg-brand-600 text-white flex items-center justify-center">
                            <i data-lucide="graduation-cap" class="w-5 h-5"></i>
                        </div>
                        <span>AURA TECH</span>
                    </div>
                    <p class="text-slate-400 leading-relaxed max-w-sm">
                        Chartered as a nonprofit research and technological polytechnic institution committed to world-changing discovery and ethical engineering.
                    </p>
                    <div class="text-slate-400 space-y-1">
                        <p>Main Campus: 400 Innovation Parkway, Tech District</p>
                        <p>Tel: +1 (800) 555-AURA • admissions@aura-tech.edu</p>
                    </div>
                </div>

                <!-- Academic Units -->
                <div>
                    <h4 class="text-white font-bold mb-3 uppercase tracking-wider text-[11px]">Academic Schools</h4>
                    <ul class="space-y-2">
                        <li><a href="#programs" class="hover:text-white transition-colors">School of Computing & AI</a></li>
                        <li><a href="#programs" class="hover:text-white transition-colors">Aerospace & Robotics</a></li>
                        <li><a href="#programs" class="hover:text-white transition-colors">Bioengineering Sciences</a></li>
                        <li><a href="#programs" class="hover:text-white transition-colors">Applied Physics & Materials</a></li>
                        <li><a href="#programs" class="hover:text-white transition-colors">Center for Tech Policy</a></li>
                    </ul>
                </div>

                <!-- Resources -->
                <div>
                    <h4 class="text-white font-bold mb-3 uppercase tracking-wider text-[11px]">Resources</h4>
                    <ul class="space-y-2">
                        <li><a href="#" onclick="openInquiryModal()" class="hover:text-white transition-colors">Admissions Portal</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">Scholarship Estimator</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">Campus Safety & Title IX</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">Academic Calendar</a></li>
                        <li><a href="#" class="hover:text-white transition-colors">Libraries & Computing</a></li>
                    </ul>
                </div>

                <!-- Newsletter Form with Accessible Label -->
                <div>
                    <h4 class="text-white font-bold mb-3 uppercase tracking-wider text-[11px]">The Aura Gazette</h4>
                    <p class="text-slate-400 mb-3">Subscribe to weekly scientific research briefs and lecture invites.</p>
                    
                    <form onsubmit="handleNewsletter(event)" class="space-y-2">
                        <div>
                            <label for="newsletterEmail" class="sr-only">University Gazette Newsletter Email Address</label>
                            <input 
                                type="email" 
                                id="newsletterEmail" 
                                name="newsletter"
                                required 
                                aria-label="University Gazette Newsletter Email Address"
                                placeholder="Enter your email" 
                                class="w-full bg-slate-900 border border-slate-700 text-xs px-3 py-2.5 rounded-xl text-white focus:outline-none focus:border-brand-500"
                            />
                        </div>
                        <button type="submit" class="w-full bg-brand-600 hover:bg-brand-500 text-white font-bold py-2 rounded-xl text-xs transition-colors">
                            Subscribe
                        </button>
                    </form>
                </div>
            </div>

            <div class="pt-8 border-t border-slate-800 flex flex-col sm:flex-row items-center justify-between gap-4 text-slate-400 text-[11px]">
                <p>© 2026 Aura Institute of Technology & Sciences. All rights reserved.</p>
                <div class="flex gap-4">
                    <a href="#" class="hover:text-slate-300">Privacy Policy</a>
                    <a href="#" class="hover:text-slate-300">Consumer Disclosures</a>
                    <a href="#" class="hover:text-slate-300">Accessibility (WCAG 2.1 AA)</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Catalog Data & Interactive Logic -->
    <script>
        // Degree Catalog Dataset
        const academicPrograms = [
            {
                id: 101,
                title: 'B.S. Artificial Intelligence & Neural Systems',
                level: 'Undergraduate',
                faculty: 'School of Computing',
                duration: '4 Years',
                credits: 128,
                tuitionPerCredit: 520,
                rating: 4.9,
                badge: 'High Demand',
                description: 'Foundational deep learning, neuromorphic architecture, autonomous perception, and transformer design.',
                image: 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 102,
                title: 'B.S. Aerospace & Astronautical Engineering',
                level: 'Undergraduate',
                faculty: 'Engineering Sciences',
                duration: '4 Years',
                credits: 134,
                tuitionPerCredit: 540,
                badge: 'ABET Accredited',
                description: 'Hypersonic aerodynamics, liquid propulsion mechanics, satellite telemetry, and orbital orbital dynamics.',
                image: 'https://images.unsplash.com/photo-1517976487502-57492c68b759?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 103,
                title: 'M.S. Quantum Informatics & Nanomaterials',
                level: 'Postgraduate',
                faculty: 'Applied Physics',
                duration: '2 Years',
                credits: 48,
                tuitionPerCredit: 680,
                badge: 'Research Funded',
                description: 'Qubit error correction, cryogenics, nanolithography fabrication, and quantum cryptographic algorithms.',
                image: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 104,
                title: 'Ph.D. Bioengineering & Synthetic Genetics',
                level: 'Doctorate',
                faculty: 'Bioengineering',
                duration: '4–5 Years',
                credits: 72,
                tuitionPerCredit: 620,
                badge: 'Full Fellowship',
                description: 'CRISPR base editing, metabolic engineering, computational proteomics, and artificial organ systems.',
                image: 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 105,
                title: 'B.S. Cyber-Physical Security & Cryptography',
                level: 'Undergraduate',
                faculty: 'School of Computing',
                duration: '4 Years',
                credits: 124,
                tuitionPerCredit: 490,
                badge: 'NSA Center',
                description: 'Zero-trust architecture, hardware enclave forensics, reverse engineering, and post-quantum lattices.',
                image: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=650&q=80'
            },
            {
                id: 106,
                title: 'Executive Certificate: Autonomous Robotics',
                level: 'Certificate',
                faculty: 'Robotics Institute',
                duration: '8 Months',
                credits: 16,
                tuitionPerCredit: 450,
                badge: 'Online & Hybrid',
                description: 'ROS2 ecosystem, LiDAR spatial mapping, inverse kinematics, and embedded real-time robotics vision.',
                image: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&w=650&q=80'
            }
        ];

        // State Store
        let shortlistedPrograms = [];
        let activeDegreeFilter = 'all';
        let searchQuery = '';
        let sortOption = 'featured';
        let meritDiscountRate = 0;
        const LAB_FEE_FLAT = 350;

        // DOM Elements
        const programsGrid = document.getElementById('programsGrid');
        const noProgramsFound = document.getElementById('noProgramsFound');
        const catalogSearchInput = document.getElementById('catalogSearchInput');
        const clearSearchBtn = document.getElementById('clearSearchBtn');
        const programSortSelect = document.getElementById('programSortSelect');
        const shortlistDrawer = document.getElementById('shortlistDrawer');
        const drawerBackdrop = document.getElementById('drawerBackdrop');
        const shortlistBadge = document.getElementById('shortlistBadge');
        const shortlistDrawerCount = document.getElementById('shortlistDrawerCount');
        const shortlistItemsContainer = document.getElementById('shortlistItemsContainer');
        const shortlistCreditBar = document.getElementById('shortlistCreditBar');
        const shortlistProgressLabel = document.getElementById('shortlistProgressLabel');
        const creditTrackingText = document.getElementById('creditTrackingText');
        const shortlistTuitionSubtotal = document.getElementById('shortlistTuitionSubtotal');
        const meritGrantRow = document.getElementById('meritGrantRow');
        const shortlistGrantAmount = document.getElementById('shortlistGrantAmount');
        const shortlistLabFee = document.getElementById('shortlistLabFee');
        const shortlistGrandTotal = document.getElementById('shortlistGrandTotal');
        const meritGrantInput = document.getElementById('meritGrantInput');
        const meritGrantFeedback = document.getElementById('meritGrantFeedback');
        const inquiryModal = document.getElementById('inquiryModal');
        const tourModal = document.getElementById('tourModal');
        const toastNotification = document.getElementById('toastNotification');
        const toastMessageText = document.getElementById('toastMessageText');

        // Filter and Sort Engine
        function getFilteredPrograms() {
            return academicPrograms.filter(prog => {
                const matchesLevel = activeDegreeFilter === 'all' || prog.level === activeDegreeFilter;
                const matchesSearch = prog.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      prog.faculty.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      prog.description.toLowerCase().includes(searchQuery.toLowerCase());
                return matchesLevel && matchesSearch;
            }).sort((a, b) => {
                if (sortOption === 'tuition-low') return a.tuitionPerCredit - b.tuitionPerCredit;
                if (sortOption === 'tuition-high') return b.tuitionPerCredit - a.tuitionPerCredit;
                if (sortOption === 'duration') return parseInt(a.duration) - parseInt(b.duration);
                return a.id - b.id;
            });
        }

        function renderPrograms() {
            const list = getFilteredPrograms();
            if (list.length === 0) {
                programsGrid.innerHTML = '';
                noProgramsFound.classList.remove('hidden');
                return;
            }

            noProgramsFound.classList.add('hidden');
            programsGrid.innerHTML = list.map(prog => {
                const isShortlisted = shortlistedPrograms.some(item => item.id === prog.id);
                return `
                    <div class="bg-white rounded-3xl border border-slate-200/90 overflow-hidden shadow-sm hover:shadow-xl hover:border-slate-300 transition-all flex flex-col group">
                        <div class="relative aspect-[16/10] overflow-hidden bg-slate-100">
                            <img 
                                src="${prog.image}" 
                                alt="${prog.title}" 
                                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out" 
                                loading="lazy"
                            >
                            <span class="absolute top-3 left-3 bg-slate-900/90 backdrop-blur text-white text-[10px] font-extrabold uppercase tracking-wider px-2.5 py-1 rounded-full shadow">
                                ${prog.badge}
                            </span>
                            <span class="absolute top-3 right-3 bg-white/95 text-slate-800 text-[10px] font-bold px-2 py-0.5 rounded-md shadow-sm">
                                ${prog.level}
                            </span>
                        </div>

                        <div class="p-6 flex-1 flex flex-col justify-between">
                            <div>
                                <span class="text-xs font-semibold uppercase tracking-wider text-brand-600 block mb-1">${prog.faculty}</span>
                                <h3 class="text-lg font-bold text-slate-900 group-hover:text-brand-600 transition-colors leading-snug">${prog.title}</h3>
                                <p class="text-xs text-slate-500 mt-2 line-clamp-2 leading-relaxed">${prog.description}</p>
                                
                                <div class="grid grid-cols-2 gap-2 mt-4 pt-3 border-t border-slate-100 text-xs text-slate-600 font-medium">
                                    <div class="flex items-center gap-1.5">
                                        <i data-lucide="clock" class="w-3.5 h-3.5 text-slate-400"></i>
                                        <span>${prog.duration}</span>
                                    </div>
                                    <div class="flex items-center gap-1.5">
                                        <i data-lucide="layers" class="w-3.5 h-3.5 text-slate-400"></i>
                                        <span>${prog.credits} Credits</span>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-6 pt-4 border-t border-slate-100 flex items-center justify-between">
                                <div>
                                    <span class="text-[11px] text-slate-400 block font-medium">Tuition / Credit</span>
                                    <span class="text-base font-black text-slate-900">$${prog.tuitionPerCredit}</span>
                                </div>
                                <button 
                                    type="button"
                                    aria-label="${isShortlisted ? 'Remove ' + prog.title + ' from shortlist' : 'Shortlist ' + prog.title}"
                                    onclick="toggleShortlist(${prog.id})" 
                                    class="text-xs font-bold px-4 py-2.5 rounded-xl transition-all flex items-center gap-1.5 ${isShortlisted ? 'bg-emerald-50 text-emerald-700 border border-emerald-300' : 'bg-brand-600 hover:bg-brand-700 text-white shadow-sm'}"
                                >
                                    <i data-lucide="${isShortlisted ? 'check' : 'bookmark'}" class="w-3.5 h-3.5"></i>
                                    <span>${isShortlisted ? 'Shortlisted' : 'Shortlist'}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');

            lucide.createIcons();
        }

        // Program Shortlist Operations
        function toggleShortlist(id) {
            const item = academicPrograms.find(p => p.id === id);
            const exists = shortlistedPrograms.some(p => p.id === id);

            if (exists) {
                shortlistedPrograms = shortlistedPrograms.filter(p => p.id !== id);
                showToast(`Removed ${item.title} from shortlist`);
            } else {
                shortlistedPrograms.push(item);
                showToast(`Added ${item.title} to shortlist`);
                toggleShortlistDrawer(true);
            }

            renderPrograms();
            updateShortlistUI();
        }

        function removeShortlist(id) {
            shortlistedPrograms = shortlistedPrograms.filter(p => p.id !== id);
            renderPrograms();
            updateShortlistUI();
        }

        function updateShortlistUI() {
            const count = shortlistedPrograms.length;
            shortlistBadge.textContent = count;
            shortlistDrawerCount.textContent = `${count} selected`;

            const totalCredits = shortlistedPrograms.reduce((sum, p) => sum + p.credits, 0);
            const tuitionSum = shortlistedPrograms.reduce((sum, p) => sum + (p.credits * p.tuitionPerCredit), 0);
            const discount = tuitionSum * meritDiscountRate;
            const labFee = count > 0 ? LAB_FEE_FLAT : 0;
            const grandTotal = Math.max(0, tuitionSum - discount + labFee);

            // Progress bar
            const creditPct = Math.min(100, (totalCredits / 120) * 100);
            shortlistCreditBar.style.width = `${creditPct}%`;
            shortlistProgressLabel.textContent = `${totalCredits} Credits`;
            creditTrackingText.textContent = count === 0 ? 'Shortlist programs to calculate credit fees' : `Evaluation for ${count} degree track(s)`;

            // Pricing
            shortlistTuitionSubtotal.textContent = `$${tuitionSum.toLocaleString()}`;
            shortlistGrantAmount.textContent = `-$${discount.toLocaleString()}`;
            shortlistLabFee.textContent = `$${labFee.toLocaleString()}`;
            shortlistGrandTotal.textContent = `$${grandTotal.toLocaleString()}`;

            if (meritDiscountRate > 0) {
                meritGrantRow.classList.remove('hidden');
            } else {
                meritGrantRow.classList.add('hidden');
            }

            // Render list
            if (count === 0) {
                shortlistItemsContainer.innerHTML = `
                    <div class="h-64 flex flex-col items-center justify-center text-center text-slate-400 p-4">
                        <div class="w-12 h-12 rounded-2xl bg-slate-100 flex items-center justify-center mb-3">
                            <i data-lucide="bookmark" class="w-6 h-6 text-slate-300"></i>
                        </div>
                        <h4 class="font-bold text-slate-700 text-sm">Your shortlist is empty</h4>
                        <p class="text-xs text-slate-400 mt-1 max-w-[220px]">Browse our engineering, computing, and science curricula to bookmark degrees.</p>
                    </div>
                `;
            } else {
                shortlistItemsContainer.innerHTML = shortlistedPrograms.map(item => `
                    <div class="p-3.5 rounded-2xl border border-slate-200/90 bg-white flex gap-3 items-center">
                        <img src="${item.image}" alt="${item.title}" class="w-14 h-14 rounded-xl object-cover border border-slate-100 flex-shrink-0">
                        <div class="flex-1 min-w-0">
                            <h4 class="text-xs font-bold text-slate-900 truncate">${item.title}</h4>
                            <span class="text-[11px] text-slate-400 block">${item.level} • ${item.credits} Credits</span>
                            <span class="text-xs font-extrabold text-brand-600 block mt-0.5">$${item.tuitionPerCredit}/credit</span>
                        </div>
                        <button 
                            type="button" 
                            aria-label="Remove ${item.title} from shortlist" 
                            title="Remove"
                            onclick="removeShortlist(${item.id})" 
                            class="p-2 text-slate-400 hover:text-rose-500 rounded-lg transition-colors"
                        >
                            <i data-lucide="trash-2" class="w-4 h-4"></i>
                        </button>
                    </div>
                `).join('');
            }

            lucide.createIcons();
        }

        function toggleShortlistDrawer(open) {
            if (open) {
                shortlistDrawer.classList.remove('translate-x-full');
                drawerBackdrop.classList.remove('opacity-0', 'pointer-events-none');
                document.body.style.overflow = 'hidden';
            } else {
                shortlistDrawer.classList.add('translate-x-full');
                drawerBackdrop.classList.add('opacity-0', 'pointer-events-none');
                document.body.style.overflow = '';
            }
        }

        // Search Handlers
        function handleProgramSearch(val) {
            searchQuery = val;
            if (catalogSearchInput.value !== val) catalogSearchInput.value = val;

            if (val.trim()) {
                clearSearchBtn.classList.remove('hidden');
            } else {
                clearSearchBtn.classList.add('hidden');
            }
            renderPrograms();
        }

        function clearSearch() {
            handleProgramSearch('');
            catalogSearchInput.focus();
        }

        function handleProgramSort(val) {
            sortOption = val;
            renderPrograms();
        }

        function filterDegree(lvl, el) {
            activeDegreeFilter = lvl;
            document.querySelectorAll('.degree-filter').forEach(btn => {
                btn.className = 'degree-filter px-4 py-2 rounded-full text-xs font-bold transition-all bg-white text-slate-600 border border-slate-200 hover:border-slate-300';
            });
            el.className = 'degree-filter active px-4 py-2 rounded-full text-xs font-bold transition-all bg-slate-900 text-white';
            renderPrograms();
        }

        function resetProgramFilters() {
            searchQuery = '';
            catalogSearchInput.value = '';
            clearSearchBtn.classList.add('hidden');
            const defaultBtn = document.querySelector('.degree-filter');
            filterDegree('all', defaultBtn);
        }

        // Merit Code Evaluation
        function applyMeritCode() {
            const val = meritGrantInput.value.trim().toUpperCase();
            if (val === 'AURA20') {
                meritDiscountRate = 0.20;
                meritGrantFeedback.textContent = '✓ 20% Academic Merit Fellowship Applied';
                meritGrantFeedback.className = 'text-xs font-bold text-emerald-600';
                meritGrantFeedback.classList.remove('hidden');
                updateShortlistUI();
                showToast('Merit code applied: 20% Tuition Reduction');
            } else {
                meritGrantFeedback.textContent = 'Invalid code. Use "AURA20" for testing.';
                meritGrantFeedback.className = 'text-xs font-bold text-rose-500';
                meritGrantFeedback.classList.remove('hidden');
            }
        }

        // Modal Controls
        function openInquiryModal(pref = null) {
            if (pref) {
                const sel = document.getElementById('preferredProgramSelect');
                if (sel) sel.value = pref;
            }
            inquiryModal.classList.remove('opacity-0', 'pointer-events-none');
            document.body.style.overflow = 'hidden';
        }

        function closeInquiryModal() {
            inquiryModal.classList.add('opacity-0', 'pointer-events-none');
            if (shortlistDrawer.classList.contains('translate-x-full')) {
                document.body.style.overflow = '';
            }
        }

        function openTourModal() {
            tourModal.classList.remove('opacity-0', 'pointer-events-none');
            document.body.style.overflow = 'hidden';
        }

        function closeTourModal() {
            tourModal.classList.add('opacity-0', 'pointer-events-none');
            if (shortlistDrawer.classList.contains('translate-x-full')) {
                document.body.style.overflow = '';
            }
        }

        function handleInquirySubmission(e) {
            e.preventDefault();
            const name = document.getElementById('applicantFullName').value;
            closeInquiryModal();
            showToast(`Thank you, ${name}! Your admissions profile has been logged.`);
            document.getElementById('admissionsInquiryForm').reset();
        }

        function submitShortlistApplication() {
            if (shortlistedPrograms.length === 0) {
                showToast('Your shortlist is empty. Select at least one degree track.');
                return;
            }
            toggleShortlistDrawer(false);
            openInquiryModal();
        }

        function handleNewsletter(e) {
            e.preventDefault();
            const emailInput = document.getElementById('newsletterEmail');
            showToast(`Subscribed ${emailInput.value} to The Aura Gazette!`);
            emailInput.value = '';
        }

        function showToast(msg) {
            toastMessageText.textContent = msg;
            toastNotification.classList.remove('opacity-0', 'translate-y-20', 'pointer-events-none');
            setTimeout(() => {
                toastNotification.classList.add('opacity-0', 'translate-y-20', 'pointer-events-none');
            }, 3000);
        }

        // Keyboard Escape listener
        window.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                toggleShortlistDrawer(false);
                closeInquiryModal();
                closeTourModal();
            }
        });

        // Initialize view
        renderPrograms();
        updateShortlistUI();
        lucide.createIcons();
    </script>
</body>
</html>
```
