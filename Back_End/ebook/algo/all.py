import json
import pandas as pd
from flask import Flask, jsonify, request
from API_BookRecommender import BookRecommendation
from connection import create_connection

app = Flask(__name__)

class BookRecommendation:
    def __init__(self):
        pass

    def recommend_books(self, user_favorites):
        recommended_books = self.get_books_from_same_category(user_favorites)
        return recommended_books

    def get_books_from_same_category(self, user_favorites):
        if not user_favorites.empty:
            category = user_favorites.iloc[0]['Book_ca']
            
            connectionDB = create_connection()
            books_table = 'books'
            query = f"""
                SELECT *
                FROM {books_table}
                WHERE Book_ca = '{category}'
            """
            recommended_books = pd.read_sql(query, connectionDB)
            connectionDB.close()
            return recommended_books
        else:
            return pd.DataFrame()

# Instantiate the BookRecommendation class
book_recommendation = BookRecommendation()

@app.route('/get_recommendations', methods=['POST'])
def get_recommendations():
    try:
     
        user_id = request.json.get('user_id')
        
        
        user_favorites = fetch_user_favorites_from_database(user_id)
        recommendations = book_recommendation.recommend_books(user_favorites)
        
     
        result_data = {
            "status": "success",
            "data": recommendations.to_dict(orient='records')
        }
        return jsonify(result_data)
    except Exception as e:
        result_data = {
            "status": "failure",
            "data": str(e)
        }
        return jsonify(result_data)

def fetch_user_favorites_from_database(user_id):
    connectionDB = create_connection()
    allfavorite_table = 'allfavorite'
    books_table = 'books'
    query = f"""
        SELECT af.favorite_id, af.favorite_userid, af.favorite_bookid, b.* 
        FROM {allfavorite_table} af
        JOIN {books_table} b ON af.Book_id = b.Book_id
        WHERE af.favorite_userid = {user_id}
    """
    user_favorites = pd.read_sql(query, connectionDB)
    connectionDB.close()
    return user_favorites

if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1', port=5005)
