<%@ page import="org.bson.Document, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobPortal - Available Jobs</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 20px;
            border-radius: 12px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
            margin-bottom: 15px;
        }

        .user-info {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
        }

        .user-badge {
            background: rgba(255, 255, 255, 0.2);
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 13px;
        }

        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.4);
            padding: 8px 20px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            font-size: 13px;
        }

        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .jobs-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .job-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            border-left: 5px solid #667eea;
        }

        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .job-title {
            font-size: 18px;
            font-weight: 700;
            color: #333;
            margin-bottom: 12px;
        }

        .job-meta {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .badge {
            background: #f0f4ff;
            color: #667eea;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .badge.type-fulltime {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .badge.type-contract {
            background: #fff3e0;
            color: #e65100;
        }

        .job-description {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .apply-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .apply-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .empty-state h2 {
            color: #666;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .empty-state p {
            color: #999;
            font-size: 14px;
        }

        .jobs-count {
            text-align: center;
            margin-bottom: 25px;
            font-size: 14px;
            color: #666;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>🚀 JobPortal</h1>
        <p>Discover Your Next Opportunity</p>
        <div class="user-info">
            <div class="user-badge">
                👤 Welcome, <%= session.getAttribute("user") %>
            </div>
            <a href="<%= request.getContextPath() %>/logout.jsp" class="logout-btn">Logout</a>
        </div>
    </div>

    <div class="container">
        <%
            List<Document> jobs = (List<Document>) request.getAttribute("jobs");
            if (jobs != null && !jobs.isEmpty()) {
        %>
            <div class="jobs-count">
                Found <strong><%= jobs.size() %></strong> amazing job opportunity<%= jobs.size() != 1 ? "ies" : "" %>
            </div>
            <div class="jobs-grid">
                <%
                    for (Document job : jobs) {
                        String title = job.getString("title");
                        String company = job.getString("company") != null ? job.getString("company") : "Tech Company";
                        String description = job.getString("description") != null ? job.getString("description") : "Join our growing team!";
                        String location = job.getString("location") != null ? job.getString("location") : "Bangalore";
                        String salary = job.getString("salary") != null ? job.getString("salary") : "Competitive";
                %>
                    <div class="job-card">
                        <div class="job-title"><%= title %></div>
                        <div class="job-meta">
                            <div class="badge"><%= company %></div>
                            <div class="badge type-fulltime">📍 <%= location %></div>
                            <div class="badge type-contract">💰 <%= salary %></div>
                        </div>
                        <div class="job-description">
                            <%= description %>
                        </div>
                        <button class="apply-btn">Apply Now</button>
                    </div>
                <%
                    }
                %>
            </div>
        <%
            } else {
        %>
            <div class="empty-state">
                <h2>📭 No Jobs Available</h2>
                <p>Check back soon for new job listings!</p>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
