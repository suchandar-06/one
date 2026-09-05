<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.netflix.model.Movie" %>
<%
    List<Movie> trendingMovies = (List<Movie>) request.getAttribute("trendingMovies");
    List<Movie> actionMovies = (List<Movie>) request.getAttribute("actionMovies");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix Clone</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { background-color: #141414; color: #fff; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; }
        
        /* Navigation Bar */
        .navbar { display: flex; align-items: center; justify-content: space-between; padding: 20px 50px; background: linear-gradient(180deg, rgba(0,0,0,0.7) 10%, transparent); position: fixed; top: 0; width: 100%; z-index: 10; }
        .logo { color: #E50914; font-size: 28px; font-weight: bold; text-decoration: none; }
        
        /* Hero Featured Section */
        .hero { height: 70vh; background: linear-gradient(rgba(0, 0, 0, 0.4), #141414), url('https://picsum.photos/1200/600') no-repeat center/cover; display: flex; flex-direction: column; justify-content: center; padding: 0 50px; }
        .hero h1 { font-size: 3rem; margin-bottom: 10px; }
        .hero p { max-width: 500px; margin-bottom: 20px; font-size: 1.1rem; color: #ccc; }
        .btn { padding: 10px 24px; font-size: 1rem; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; margin-right: 10px; }
        .btn-play { background-color: #fff; color: #000; }
        .btn-info { background-color: rgba(109, 109, 110, 0.7); color: #fff; }
        
        /* Row Carousel */
        .row { padding: 20px 50px; }
        .row h2 { margin-bottom: 10px; font-size: 1.4rem; }
        .row-posters { display: flex; overflow-x: scroll; padding: 10px 0; scrollbar-width: none; }
        .row-posters::-webkit-scrollbar { display: none; }
        .poster { width: 200px; height: 120px; object-fit: cover; margin-right: 10px; border-radius: 4px; transition: transform 0.3s; cursor: pointer; flex-shrink: 0; }
        .poster:hover { transform: scale(1.08); }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="#" class="logo">NETFLIX</a>
    </nav>

    <div class="hero">
        <h1>Stranger Things</h1>
        <p>When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.</p>
        <div>
            <button class="btn btn-play">Play</button>
            <button class="btn btn-info">More Info</button>
        </div>
    </div>

    <!-- Trending Now Row -->
    <div class="row">
        <h2>Trending Now</h2>
        <div class="row-posters">
            <% 
                if (trendingMovies != null) {
                    for (Movie movie : trendingMovies) { 
            %>
                        <img class="poster" src="<%= movie.getThumbnailUrl() %>" alt="<%= movie.getTitle() %>" title="<%= movie.getTitle() %>">
            <% 
                    }
                } 
            %>
        </div>
    </div>

    <!-- Action Movies Row -->
    <div class="row">
        <h2>Action Blockbusters</h2>
        <div class="row-posters">
            <% 
                if (actionMovies != null) {
                    for (Movie movie : actionMovies) { 
            %>
                        <img class="poster" src="<%= movie.getThumbnailUrl() %>" alt="<%= movie.getTitle() %>" title="<%= movie.getTitle() %>">
            <% 
                    }
                } 
            %>
        </div>
    </div>

</body>
</html>
