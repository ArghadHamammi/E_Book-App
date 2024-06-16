import pandas as pd
from sklearn.neighbors import NearestNeighbors
from connection import create_connection 

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
