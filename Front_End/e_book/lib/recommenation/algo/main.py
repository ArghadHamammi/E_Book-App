from flask import Flask, jsonify
from API_BookRecommender import BookRecommender
from sqlalchemy import create_engine
import pandas as pd
from connection import create_connection

app = Flask(__name__)

# Instantiate the BookRecommendation class
book_recommendation = BookRecommender()

@app.route('/get_recommendations/<user_id>', methods=['GET'])
def get_recommendations(user_id):
    user_favorites = fetch_user_favorites_from_database(user_id)
    recommendations = book_recommendation.recommend_books(user_favorites)
    recommendations_json = recommendations.to_json(orient='records')  
    return jsonify(recommendations_json)


def fetch_user_favorites_from_database(user_id):
    connectionDB = create_connection()

    allfavorite_table = 'allfavorite'
    books_table = 'books'

    query = f"""
        SELECT b.*
        FROM {allfavorite_table} af
        JOIN {books_table} b ON af.Book_id = b.Book_id
        WHERE af.favorite_userid = {user_id}
    """

    user_favorites = pd.read_sql(query, connectionDB)
    
    # Check if DataFrame is empty
    if user_favorites.empty:
        user_favorites = None

    connectionDB.close()

    return user_favorites



if __name__ == '__main__':
    user_id = "2"  
    user_favorites = fetch_user_favorites_from_database(user_id)
    recommendations = book_recommendation.recommend_books(user_favorites)

   
    print(recommendations)


    app.run(debug=True, host='127.0.0.1', port=5005)