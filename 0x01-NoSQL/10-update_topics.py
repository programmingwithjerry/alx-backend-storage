#!/usr/bin/env python3
"""
Module to update the topics of a school document in a MongoDB collection.
"""

def update_topics(mongo_collection, name, topics):
    """
    Updates the topics of a school document based on the school name.

    Parameters:
    mongo_collection (pymongo.collection.Collection):
    The collection where the school document will be updated.
    name (str): The name of the school document to update.
    topics (list): A list of topics to set for the school.

    Return:
    None
    """
    # Update the 'topics' field of the document where the 'name' matches
    mongo_collection.update_many(
        { "name": name },  # Filter: documents with the given school name
        { "$set": { "topics": topics } }  # Update: set the 'topics' field
    )
