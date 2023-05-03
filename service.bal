import ballerina/log;
import ballerina/graphql;

CertificationExam[] exams = [
        {
            id: "1",
            name: "Certification Exam 1",
            examId: "CE001",
            date: "2022-01-01",
            state: "Passed",
            createdDate: "2022-01-01",
            examDate: "2022-01-01",
            expirationDate: "2023-01-01",
            examVersion: "1.0",
            examType: "Online",
            examVisibleType: "Public",
            examPaperType: "Digital"
        },
        {
            id: "2",
            name: "Certification Exam 2",
            examId: "CE002",
            date: "2022-02-01",
            state: "Failed",
            createdDate: "2022-02-01",
            examDate: "2022-02-01",
            expirationDate: "2023-02-01",
            examVersion: "1.1",
            examType: "In-Person",
            examVisibleType: "Private",
            examPaperType: "Physical"
        }
    ];

# Sales entity GraphQL service.
service /graphql on new graphql:Listener(9090) {
    function init() {
        // TODO: Implement health checks
        log:printInfo("GraphQL service started.");
    }

    # Query Exams based on the provided filter criteria.
    # 
    # + filter - Exam filters object
    # + limit -  Number of records to query (default: SOQL_DEFAULT_LIMIT and max: SOQL_UPPER_LIMIT)
    # + offset - Number of records to offset (default: 0)
    # + return - List of exams
    # 
    resource function get exams(ExamFilter? filter, int? 'limit, int? offset) returns CertificationExam[]|error {
        log:printInfo(filter.toString());
        log:printInfo('limit.toString());
        log:printInfo(offset.toString());
        return exams; 
    }
}