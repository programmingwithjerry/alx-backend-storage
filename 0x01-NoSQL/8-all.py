def list_all(mongo_collection):
    """
    Lists all documents in a MongoDB collection.

    Parameters:
    mongo_collection (pymongo.collection.Collection): The collection to list documents from.
    """
    # Retrieve all documents in the collection
    documents = mongo_collection.find()
    
    # Convert the cursor to a list and return it
    return list(documents)