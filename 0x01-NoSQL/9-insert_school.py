#!/usr/bin/env python3
"""
Module to insert a new document in a MongoDB collection based on kwargs.
"""

from pymongo.results import InsertOneResult

def insert_school(mongo_collection, **kwargs):
    """
    Inserts a new document in a MongoDB collection based on kwargs.

    Parameters:
    mongo_collection (pymongo.collection.Collection):
    The collection where the document will be inserted.
    **kwargs: The key-value pairs to be inserted as the document.

    Return:
    str: The _id of the newly inserted document.
    """
    result = mongo_collection.insert_one(kwargs)
    
    # Return the _id of the newly inserted document
    return result.inserted_id
