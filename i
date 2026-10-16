index.html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CU ShareHub - P2P Campus Resource Sharing</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f4f6f9;
            color: #333;
        }
        header {
            background: #1e3c72;
            background: linear-gradient(to right, #2a5298, #1e3c72);
            color: white;
            padding: 1.5rem 2rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        header h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
        }
        header p {
            font-size: 1rem;
            opacity: 0.9;
        }
        .container {
            max-width: 1100px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .search-section {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        .search-section input, .search-section select {
            flex: 1;
            min-width: 200px;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
        }
        .add-resource-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
        }
        .add-resource-card h2 {
            margin-bottom: 1rem;
            color: #1e3c72;
        }
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1rem;
            margin-bottom: 1rem;
        }
        .form-grid input, .form-grid select, .form-grid textarea {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
        }
        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.2s ease;
        }
        .btn:hover {
            background-color: #218838;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
        }
        .card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card .badge {
            align-self: flex-start;
            background: #e1f0ff;
            color: #0066cc;
            padding: 0.3rem 0.6rem;
            border-radius: 4px;
            font-size: 0.85rem;
            font-weight: bold;
            margin-bottom: 0.8rem;
        }
        .card h3 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }
        .card p {
            color: #666;
            font-size: 0.95rem;
            margin-bottom: 1rem;
        }
        .card .contact {
            margin-top: auto;
            padding-top: 0.8rem;
            border-top: 1px solid #eee;
            font-size: 0.9rem;
            color: #333;
            font-weight: bold;
        }
        footer {
            text-align: center;
            padding: 1.5rem;
            margin-top: 3rem;
            background: #333;
            color: white;
        }
    </style>
</head>
<body>

    <header>
        <h1>CU ShareHub</h1>
        <p>Peer-to-Peer Campus Resource Sharing Platform</p>
    </header>

    <div class="container">
        <!-- Add Resource Form -->
        <div class="add-resource-card">
            <h2>Share a Resource</h2>
            <form id="resourceForm">
                <div class="form-grid">
                    <input type="text" id="title" placeholder="Title (e.g. DBMS Notes, Drafter)" required>
                    <select id="category" required>
                        <option value="">Select Category</option>
                        <option value="Notes">Notes / PDFs</option>
                        <option value="Books">Books</option>
                        <option value="Tools">Lab Tools / Instruments</option>
                        <option value="Other">Other</option>
                    </select>
                    <input type="text" id="contact" placeholder="Contact Info (Phone / WhatsApp)" required>
                </div>
                <textarea id="description" rows="2" placeholder="Short description..." required style="margin-bottom: 1rem;"></textarea>
                <button type="submit" class="btn">Share Item</button>
            </form>
        </div>

        <!-- Search & Filter -->
        <div class="search-section">
            <input type="text" id="searchInput" placeholder="Search resources...">
            <select id="filterCategory">
                <option value="All">All Categories</option>
                <option value="Notes">Notes / PDFs</option>
                <option value="Books">Books</option>
                <option value="Tools">Lab Tools / Instruments</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <!-- Items Display -->
        <h2 style="margin-bottom: 1rem; color: #1e3c72;">Available Resources</h2>
        <div class="grid" id="resourceGrid">
            <!-- Dynamic items will be added here -->
        </div>
    </div>

    <footer>
        <p>&copy; 2026 CU ShareHub - Built for Campus Peer Support</p>
    </footer>

    <script>
        const initialResources = [
            {
                title: "Data Structures & Algorithms Notes",
                category: "Notes",
                description: "Handwritten unit 1 to 4 notes for CSE 2nd year.",
                contact: "+91 9876543210"
            },
            {
                title: "Engineering Drawing Drafter",
                category: "Tools",
                description: "Perfect condition drafter available for sharing/rent.",
                contact: "WhatsApp: +91 9123456789"
            },
            {
                title: "Let Us C - Yashavant Kanetkar",
                category: "Books",
                description: "C Programming textbook for 1st semester students.",
                contact: "Contact: Student block 3"
            }
        ];

        let resources = JSON.parse(localStorage.getItem("cu_sharehub_items")) || initialResources;

        function renderResources() {
            const grid = document.getElementById("resourceGrid");
            const searchVal = document.getElementById("searchInput").value.toLowerCase();
            const filterVal = document.getElementById("filterCategory").value;

            grid.innerHTML = "";

            const filtered = resources.filter(item => {
                const matchesSearch = item.title.toLowerCase().includes(searchVal) || item.description.toLowerCase().includes(searchVal);
                const matchesCategory = filterVal === "All" || item.category === filterVal;
                return matchesSearch && matchesCategory;
            });

            if (filtered.length === 0) {
                grid.innerHTML = "<p style='grid-column: 1/-1; text-align: center; color: #777;'>No resources found.</p>";
                return;
            }

            filtered.forEach(item => {
                const card = document.createElement("div");
                card.className = "card";
                card.innerHTML = `
                    <span class="badge">${item.category}</span>
                    <h3>${item.title}</h3>
                    <p>${item.description}</p>
                    <div class="contact">📍 ${item.contact}</div>
                `;
                grid.appendChild(card);
            });
        }

        document.getElementById("resourceForm").addEventListener("submit", function(e) {
            e.preventDefault();
            const newItem = {
                title: document.getElementById("title").value,
                category: document.getElementById("category").value,
                contact: document.getElementById("contact").value,
                description: document.getElementById("description").value
            };
            resources.unshift(newItem);
            localStorage.setItem("cu_sharehub_items", JSON.stringify(resources));
            renderResources();
            this.reset();
        });

        document.getElementById("searchInput").addEventListener("input", renderResources);
        document.getElementById("filterCategory").addEventListener("change", renderResources);

        // Initial load
        renderResources();
    </script>
</body>
</html>
 
