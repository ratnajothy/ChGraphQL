import ballerina/graphql;
import ballerina/http;

# [Entity Result] GraphQL Exam entity result mapping
# 
# + data - GraphQL result
type EntityExamPayload record {|
    *graphql:GenericResponseWithErrors;
    record {|
        CertificationExam[] exams;
    |} data;
|};

configurable string host = "localhost";
configurable int port = 9090;
configurable string tokenUrl = "";
configurable string clientId = "";
configurable string clientSecret = "";

graphql:Client graphqlClient = check new (string `${host}/graphql`, {
    auth: {
        tokenUrl: tokenUrl,
        clientId: clientId,
        clientSecret: clientSecret
    }
});

# Get Exams by Contact Id
#
# + contactId - Contact Id of the contact
# + id - Id of the exam
# + return - App registered exam if successful else error
public function getExams(string? contactId = (), string? id = ()) returns CertificationExam[]|error {
    string document = string `
    query examQuery($filter : ExamFilter!) {
        exams(filter: $filter){
            id
            examId
            state
            expirationDate
            examType
            examVisibleType
            examPaperType
        }
    }`;

    EntityExamPayload result = check graphqlClient->execute(document, 
                {filter: {
                    contactId: contactId,
                    id: id
                    }
                });
    return result.data.exams;
}

# Certification service is a network-accessible Public API
# Which allows user to register for WSO2 Certification
service / on new http:Listener(9090) {
    # Get exam by id.
    # 
    # + id - Contact Email that allocated to a particular contact.
    # + return - Exam object. 
    resource function get exam(string? contactId, string? id) returns CertificationExam[]|error {
        CertificationExam[] contact =  check getExams(contactId, id);
        return contact;
    }
}
