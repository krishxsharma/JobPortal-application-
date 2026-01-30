package com.jobportal.dao;

import com.jobportal.util.MongoUtil;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class JobDAO {

    public static List<Document> getJobs() {
        MongoCollection<Document> collection =
                MongoUtil.getDatabase().getCollection("jobs");

        return collection.find().into(new ArrayList<>());
    }
}
