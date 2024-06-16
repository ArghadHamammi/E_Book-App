import pandas as pd
from sklearn.preprocessing import LabelEncoder
from connection import create_connection
from sklearn.metrics.pairwise import cosine_similarity

class BookRecommender:
    def __init__(self):
        pass

    def recommend_books(self, user_favorites=None):
        if user_favorites is not None:
            return self.get_content_based_recommendations(user_favorites)
        else:
            return self.get_random_recommendations()


    
    def get_content_based_recommendations(self, user_favorites, num_books=5):
        connectionDB = create_connection()
        books_table = 'books'

        
        all_books = pd.read_sql(f"SELECT * FROM {books_table}", connectionDB)

        categorical_features = ['Book_ca', 'book_auther']
        encoders = dict()
        for book in categorical_features:
            encoders[book] = LabelEncoder()
            all_books[f'{book}_n'] = encoders[book].fit_transform(all_books[book])

      
        if user_favorites is None or user_favorites.empty:
            return self.get_random_recommendations(num_books)

        
        for book in categorical_features:
            user_favorites[f'{book}_n'] = encoders[book].transform(user_favorites[book])
        

        
        user_favorites = user_favorites.drop(['book_title' ,'book_auther','book_link','data_published','book_publisher','Book_image','Book_ca',], axis=1)
        all_books = all_books.drop(['book_title' ,'book_auther','book_link','data_published','book_publisher','Book_image','Book_ca',], axis=1)


        
        similarity_scores = cosine_similarity(user_favorites, all_books)

        
        recommended_book_indices = similarity_scores[0].argsort()[::-1][:num_books]

        
        recommended_books = all_books.iloc[recommended_book_indices]

        recommended_books_info = pd.DataFrame()
        for index, row in recommended_books.iterrows():
            book_id = row['Book_id']
            book_info = pd.read_sql(f"SELECT * FROM {books_table} WHERE Book_id = {book_id}", connectionDB)
            recommended_books_info = pd.concat([recommended_books_info, book_info])


        connectionDB.close()
        return recommended_books_info



        
    



    def get_random_recommendations(self, num_books=5):
        connectionDB = create_connection()
        books_table = 'books'

        all_books = pd.read_sql(f"SELECT * FROM {books_table}", connectionDB)

        
        recommended_books = all_books.sample(n=num_books)

        connectionDB.close()
        return recommended_books
