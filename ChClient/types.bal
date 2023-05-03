public enum EndDateBaseClosureState {
    OPEN ,
    NOTIFIED,
    CLOSURE_NOTICES,
    RESTRICTED,
    CLOSED
}

public enum InvoiceBasedClosureState {
    OPEN,
    NOTIFIED,
    CLOSURE_NOTICES,
    RESTRICTED,
    CLOSED
}

# Query Hour Base Closure States
#
# This is somewhat similar to the end date based closure except for end date we are using allocated hours and the consumed hours

# Main states : 
# Open, Notified, Closure Notices, Restricted (Development Support), 
# Query Deactivated (Subscription), Closed

# Example :
# Send Notification at 75% of the hours consumption 
# Send closure notification to customer 90%
# At 100% Restrict/Disable queries based on subscription type (support account type )
#
public enum QueryHourBasedClosureState{ 
    OPEN,
    NOTIFIED,
    CLOSURE_NOTICES,
    RESTRICTED,
    QUERY_DEACTIVATED,
    CLOSED
}

# [Entity] Customer Entity
# * - only available in realtime data (data fetching from salesforce)
#
# + id - Customer ID  
# + name - Name of the Customer *  
# + customerType - Type of the customer *  
# + classification - Customer Classification *  
# + region - Region of the customer  
# + industry - Industry of customer  *  
# + subIndustry - Sub Industry  
# + naicsIndustry - Customer industry according to North American Industry Classification System  
# + phone - Customer Contact Number  
# + subRegion - Sub Region of the customer  
# + salesRegions - Sales Regions of the customer  
# + salesRegion - Sales Region of the customer  
# + globalPod - global POD  
# + arrToday - ARR Today  
# + isPartner - Is customer a partner  
# + status - Account Life Cycle  [available in syncDB/ salesforce]  
# + vertical - customer Vertical Information   [available in syncDB/ salesforce]  
# + technicalOwner - Technical Owner of the Customer  [available in syncDB/ salesforce]  
# + partners - customer partners list  
# + address - Address of the Customer  [available in syncDB(only country)*/ salesforce]  
# + owner - Account Manager of the Customer [available in syncDB(only email)*/ salesforce]  
# + csm - Customer Success Manager Of the Customer  [available in salesforce]  
# + isInSf - Is available in Salesforce  [available in syncDB]  
# + opportunities - Opportunity List  [available in syncDB/ salesforce]  
# + subscriptions - customer subscriptions  
# + contacts - Customer user list [available in  salesforce]  
# + supportTier - Customer support tier  (Basic/Enterprise)  
# + supportTimezone - Customer support timezone 
# + domainList - Contact allowed Domain List
public type Customer record {
    string id;
    string? name;
    string? customerType = ();
    string? classification = ();
    string? region = ();
    string? industry = ();
    string? subIndustry = ();
    string? naicsIndustry = ();
    string? phone = ();
    string? subRegion = ();
    string? salesRegions = ();
    string? salesRegion = ();
    string? globalPod = ();
    decimal? arrToday = ();
    boolean? isPartner = ();
    string? status = ();
    string? vertical = ();
    string? technicalOwner = ();
    Partner[]?  partners = [];
    Address? address = ();
    User? owner = ();
    User? csm = ();
    int? isInSf = ();
    Opportunity[]? opportunities = [];
    Subscription[]? subscriptions = [];
    Contact[]? contacts = ();
    string? supportTier = (); 
    string? supportTimezone = ();
    string? domainList = ();
};

# [Entity] Partner Entity
# * - only available in realtime data (data fetching from salesforce)
#
# + id - Partner ID  
# + name - Name of the Partner *  
# + type - Type of the customer *  
# + classification - Partner Classification *  
# + region - Region of the customer  
# + industry - Industry of customer  *  
# + subIndustry - Sub Industry  
# + naicsIndustry - Customer industry according to North American Industry Classification System  
# + phone - Partner Contact Number  
# + subRegion - Sub Region of the customer  
# + salesRegions - Sales Region of the customer  
# + globalPod - global POD  
# + arrToday - ARR Today  
# + isPartner - Is customer a partner  
# + status - Account Life Cycle  [available in syncDB/ salesforce]  
# + vertical - customer Vertical Information   [available in syncDB/ salesforce]  
# + technicalOwner - Technical Owner of the Partner  [available in syncDB/ salesforce] 
# + address - Address of the Partner  [available in syncDB(only country)*/ salesforce]  
# + owner - Account Manager of the Partner [available in syncDB(only email)*/ salesforce]  
# + csm - Partner Success Manager Of the Partner  [available in salesforce]  
# + isInSf - Is available in Salesforce  [available in syncDB]
# + subscriptions - Partner subscriptions 
# + contacts - Partner user list [available in  salesforce]
public type Partner record {
    string id;
    string? name;
    string? 'type = ();
    string? classification = ();
    string? region = ();
    string? industry = ();
    string? subIndustry = ();
    string? naicsIndustry = ();
    string? phone = ();
    string? subRegion = ();
    string? salesRegions = ();
    string? globalPod = ();
    decimal? arrToday = ();
    boolean? isPartner = ();
    string? status = ();
    string? vertical = ();
    string? technicalOwner = ();
    Address? address = ();
    User? owner = ();
    User? csm = ();
    int? isInSf = ();
    Subscription[]? subscriptions = [];
    Contact[]? contacts = ();
};

# [Entity] Opportunity
#
# + id - Opportunity ID  
# + name - Opportunity name  
# + customerId - Customer ID  
# + isInSf - Is available in Salesforce  
# + arr - ARR amount
# + arrOpportunity - Amount  
# + delayedArr - Delayed ARR
# + delayedArrOpportunity - Delayed opportunity amount  
# + iamArr - IAM arr amount
# + iamOpportunity - IAM amount  
# + delayedIamArr - Delayed IAM amount
# + delayedIamOpportunity - Delayed IAM ARR amount  
# + integrationArr - Integration ARR amount
# + integrationOpportunity - Integration amount  
# + delayedIntegrationArr - Delayed integration ARR amount
# + delayedIntegrationOpportunity - Delayed integration amount  
# + openBankingArr - Open Banking ARR amount
# + openBankingOpportunity - Open Banking amount
# + delayedOpenBankingArr - Delayed Open Banking ARR amount
# + delayedOpenBankingOpportunity - Delayed Open Banking
# + iamPso - IAM PSO
# + cloudArrToday - Cloud ARR today
# + cloudArr - Cloud ARR
# + owner - Opportunity Owner details  
# + partnerRole - Partner role of the opportunity
# + customer - Opportunity Customer details  
# + endDateRollUp - End Date Roll-up  
# + startDateRollUp - Start Date Roll-up  
# + supportAccountEndDateRollUp - End Date support Roll-up  
# + supportAccountStartDateRollUp - Start support Date Roll-up  
# + cloudAccountStartDate - Cloud account start date
# + cloudAccountEndDate - Cloud account end date
# + stageName - Stage name  
# + businessUnit - Opportunity business unit  
# + renewalDelayed - Is Delayed  
# + invoices - invoices linked with opportunity  
# + subscriptionLineItems - subscribed product list (customer purchased product list)  
# + arrType - ARR type  
# + isWon - Is won  
# + preSalesCode - Pre Sales Engagement Code  
# + postSalesEngagementCode - Post Sales Engagement Code  
# + customerAddress - Account Address  
# + technicalOwner - Technical Owner  
# + closeDate - Close Date  
# + confidence - Close Date Confidence  
# + entryVector - Entry Vector  
# + recordId - Opportunity record id 
# + recordType - Opportunity record type  
# + salesforceRecordId - salesforce record id, can be used for generate Salesforce Url  
# + lastModifiedById - Last Modified By ID  
# + leadSource - Lead Source  
# + leadType - Lead State  
# + monthEndArr - Month End ARR WF  
# + monthEndArrDate - Month End ARR Date  
# + nextQtrArrDate - Next QTR ARR Date WF  
# + nextStep - Next Step  
# + nextSteps - Next Steps  
# + currencyIsoCode - Opportunity Currency1  
# + 'type - Type of the opportunity
# + pocStartDate - POC Start Date  
# + pocEndDate - POC End Date  
# + qsStartDateRollUp - QS Start Date Roll-up  
# + qsEndDateRollUp - QS End Date Roll-up  
# + qsEngagementCode - QS Engagement Code  
# + sqlDate - SQL Date  
# + spotDraftContactStatus - Status  
# + yearEndArr - Year End ARR  
# + amount - Amount  
# + cloudArrOpportunity - Cloud ARR - Opportunity  
# + uninvoiceableCloudArr - Un-invoiceable Cloud ARR  
# + expectedCaseAmount - Expected Case Amount  
# + healthcareBuArrOpportunity - Healthcare BU ARR - Opportunity  
# + healthcareUninvoiceableArr - Healthcare Un - invoiceable ARR  
# + iamBuArrOpportunity - IAM BU ARR - Opportunity  
# + iamCloudArrOpportunity - IAM Cloud ARR - Opportunity  
# + iamUninvoiceableArr - IAM Un-invoiceable ARR  
# + iamUninvoiceableCloudArr - IAM Un-invoiceable Cloud ARR  
# + incrementalArr - Incremental ARR - WF  
# + integrationBUArrOpportunity - Integration BU ARR - Opportunity  
# + integrationCloudArrOpportunity - Integration Cloud ARR - Opportunity  
# + integrationPso - Integration PSO  
# + integrationUninvoiceableArr - Integration Un-invoiceable ARR  
# + integrationUninvoiceableCloudArr - Integration Un-invoiceable Cloud ARR  
# + invoicedAmount - Invoiced Amount  
# + openBankingBuArrOpportunity - Open Banking BU ARR - Opportunity  
# + openBankingUninvoiceableArr - Open Banking Un-invoiceable ARR  
# + priceIncreaseOnRenewal - Price Increase % on Renewal  
# + probability - Probability (%)  
# + uninvoiceableArr - Un-invoiceable ARR
# + todayDelayedArr - Today Delayed ARR
# + integrationArrTodayDelayedArr - Integration ARR Today Delayed ARR
# + iamArrTodayDelayedArr - IAM ARR Today Delayed ARR
# + worseCaseAmount - Worse Case Amount
public type Opportunity record {
    string id;
    string? name = ();
    string customerId;
    int? isInSf = ();
    decimal? arr = ();
    decimal? arrOpportunity = ();
    decimal? delayedArr = ();
    decimal? delayedArrOpportunity = ();
    decimal? iamArr = ();
    decimal? iamOpportunity = ();
    decimal? delayedIamArr = ();
    decimal? delayedIamOpportunity = ();
    decimal? integrationArr = ();
    decimal? integrationOpportunity = ();
    decimal? delayedIntegrationArr = ();
    decimal? delayedIntegrationOpportunity = ();
    decimal? openBankingArr = ();
    decimal? openBankingOpportunity = ();
    decimal? delayedOpenBankingArr = ();
    decimal? delayedOpenBankingOpportunity = ();   
    decimal? iamPso = ();
    decimal? cloudArrToday = ();
    decimal? cloudArr = ();
    User? owner = ();
    string? partnerRole = ();
    CustomerMinimal? customer = ();
    string? endDateRollUp = ();
    string? startDateRollUp = ();
    string? supportAccountEndDateRollUp = ();
    string? supportAccountStartDateRollUp = ();
    string? cloudAccountStartDate = ();
    string? cloudAccountEndDate = ();
    string? stageName = ();
    string? businessUnit = ();
    boolean? renewalDelayed = ();
    Invoice[] invoices = [];
    SubscriptionLineItem[] subscriptionLineItems = [];
    string? arrType = ();
    boolean? isWon = ();
    string? preSalesCode = ();
    string? postSalesEngagementCode = ();
    string? customerAddress = ();
    string? technicalOwner = ();
    string? closeDate = ();
    string? confidence = ();
    string? entryVector = ();
    string? recordId = ();
    string? recordType = ();
    string? salesforceRecordId = ();
    string? lastModifiedById = ();
    string? leadSource = ();
    string? leadType = ();
    string? monthEndArr = ();
    string? monthEndArrDate = ();
    string? nextQtrArrDate = ();
    string? nextStep = ();
    string? nextSteps = ();
    string? currencyIsoCode = ();
    string? 'type = ();
    string? pocStartDate = ();
    string? pocEndDate = ();
    string? qsStartDateRollUp = ();
    string? qsEndDateRollUp = ();
    string? qsEngagementCode = ();
    string? sqlDate = ();
    string? spotDraftContactStatus = ();
    string? yearEndArr = ();
    decimal? amount = ();
    decimal? cloudArrOpportunity = ();
    decimal? uninvoiceableCloudArr = ();
    decimal? expectedCaseAmount = ();
    decimal? healthcareBuArrOpportunity = ();
    decimal? healthcareUninvoiceableArr = ();
    decimal? iamBuArrOpportunity = ();
    decimal? iamCloudArrOpportunity = ();
    decimal? iamUninvoiceableArr = ();
    decimal? iamUninvoiceableCloudArr = ();
    decimal? incrementalArr = ();
    decimal? integrationBUArrOpportunity = ();
    decimal? integrationCloudArrOpportunity = ();
    decimal? integrationPso = ();
    decimal? integrationUninvoiceableArr = ();
    decimal? integrationUninvoiceableCloudArr = ();
    decimal? invoicedAmount = ();
    decimal? openBankingBuArrOpportunity = ();
    decimal? openBankingUninvoiceableArr = ();
    decimal? priceIncreaseOnRenewal = ();
    decimal? probability = ();
    decimal? uninvoiceableArr = ();
    decimal? todayDelayedArr = ();
    decimal? integrationArrTodayDelayedArr = ();
    decimal? iamArrTodayDelayedArr = ();
    decimal? worseCaseAmount = ();

};

# Bookings related summary
#
# + bookingsIntegrationRecurring - Bookings integration recurring  
# + bookingsIamRecurring - Bookings IAM recurring  
# + bookingRecurringTotal - Bookings recurring total  
# + bookingsIntegrationNonRecurring - Bookings integration non recurring
# + bookingsIamNonRecurring - Booking IAM non recurring  
# + bookingsNonRecurringTotal - Booking non recurring total  
# + bookingsCloudTotal - Booking cloud total
public type Booking record {
    decimal? bookingsIntegrationRecurring = ();
    decimal? bookingsIamRecurring = ();
    decimal? bookingRecurringTotal = ();
    decimal? bookingsIntegrationNonRecurring = ();
    decimal? bookingsIamNonRecurring = ();
    decimal? bookingsNonRecurringTotal = ();
    decimal? bookingsCloudTotal = ();
};

# Represents a Opportunity marketing statistic result
#
# + id - Opportunity Id  
# + entry - Opportunity Entry  
# + customer - Opportunity customer details  
public type OpportunityStats record {
    string? id;
    string? entry;
    CustomerMinimal? customer = ();
};

# Customer Subscription
#
# + id - Subscription CRM id  
# + name - Subscription Name  
# + key - Unique key 
# + description - Description of the subscription
# + type - Subscription type 
# + status - Status of subscription (closure state / overall )
# + closureStates - Subscription Closure States [End Date Based/ Invoice Based and Query Hour Based]    
# + startDate - Current (valid subscriptions) start date 
# + endDate - Current (valid subscriptions) end date  
# + customerId - Customer ID  
# + members - Members in this Subscription 
# + subscriptionLineItems - subscribed products
# + linkedOpportunities - linked opportunities
public type Subscription record {
    string id;
    string? name = ();
    string? key = ();
    string? description = ();
    string? 'type = ();
    string? status = ();
    string? startDate = ();
    ClosureStates? closureStates = ();
    string? endDate = ();
    string? customerId = ();
    Member[]? members = [];
    SubscriptionLineItem[] subscriptionLineItems = [];
    LinkedOpportunity[] linkedOpportunities = [];
};


# Used for grouping Support account closure states
#
# + endDateBased - End Date Based Closure State 
# + invoiceBased - Invoice Based Closure State 
# + queryHourBased - Query Hour Based Closure State
public type ClosureStates record {
    EndDateBaseClosureState? endDateBased;
    InvoiceBasedClosureState? invoiceBased;
    QueryHourBasedClosureState? queryHourBased;
};

# Used for grouping Support account closure states
#
# + endDateBasedInput - End Date Based Closure State 
# + invoiceBasedInput - Invoice Based Closure State 
# + queryHourBasedInput - Query Hour Based Closure State
public type ClosureStatesInput record {
    EndDateBaseClosureState? endDateBasedInput;
    InvoiceBasedClosureState? invoiceBasedInput;
    QueryHourBasedClosureState? queryHourBasedInput;
};

# Represent link between opportunity and subscription 
#
# + id - link CRM id  
# + name - name of link  
# + opportunityId - opportunity id
# + subscriptionId - subscription  id
public type LinkedOpportunity record {
    string id;
    string? name;
    string? subscriptionId;
    string opportunityId;
};

# Represent a Invoice
#
# + id - Invoice Id  
# + name - Invoice Name  
# + opportunityId - Opportunity id  
# + amount - Invoiced Amount  
# + dueDate - Due Date of Invoice  
# + paidDate - Paid Date of Invoice  
# + invoiceDate - Invoice Date
# + poNumber - PO Number
# + engagementCode - Engagement Code
# + currencyCode - Currency Code
# + classification - Invoice Classification  
# + description - Description  
# + serviceStartDate - Service Start Date  
# + serviceEndDate - Service End Date
public type Invoice record {|
    string? id;
    string? name;
    string? opportunityId;
    decimal? amount;
    string? dueDate;
    string? paidDate;
    string? invoiceDate;
    string? poNumber;
    string? engagementCode;
    string? currencyCode;
    string? classification;
    string? description;
    string? serviceStartDate;
    string? serviceEndDate;

|};

# Represent a customer subscription line item (customer purchased product)
#
# + id - Id of Subscription   
# + opportunityId - Opportunity ID   
# + name - Name of Subscription 
# + quantity - Products Quantity   
# + totalPrice - Products Total Price   
# + environment - Environment
# + classification - Subscription classification (PP,PS etc)
# + serviceStartDate - Subscription Start Date
# + serviceEndDate - Subscription End Date
# + description - Description
# + engagementCodeAuto - Engagement Code
# + isTentativeDates - Is tentative dates
# + productUnit - Product Unit
# + businessUnit - Business Unit
# + product - Subscribed Product
public type SubscriptionLineItem record {|
    string? id;
    string? opportunityId;
    string? name;
    decimal? quantity;
    decimal? totalPrice = ();
    string? environment;
    string? classification;
    string? serviceStartDate;
    string? serviceEndDate;
    string? description = ();
    string? engagementCodeAuto = ();
    boolean? isTentativeDates = ();
    string? productUnit = ();
    string? businessUnit = ();
    Product? product;
|};

# Represent a product
#
# + id - Product Id  
# + name - Product Name
# + description - Description of the Product  
# + productUnit - Product Unit
# + family - Family of the Product  
# + productCode - Product Code (use for U2 mapping)  
# + productClassification - Product Classification 
# + engProductCode - Engineering product code ( list of product abbreviation)
public type Product record {|
    string? id;
    string? name;
    string? description;
    string? productUnit;
    string? family;
    string? productCode;
    string? productClassification;
    string? engProductCode;
|};

# Represent a address
#
# + street - street of the Address  
# + city - city  of the Address  
# + state - State  of the Address
# + country - Country  of the Address
# + postalCode - Postal code of the Address
public type Address record {
    string? street = ();
    string? city = ();
    string? state = ();
    string? country = ();
    string? postalCode = ();
};

# Represent a customer contact
#
# + id - CRM id 
# + name - customer full name  
# + firstName - First Name  
# + lastName - Last Name  
# + email - email of the customer  
# + title - Contact title (Designation)
# + customerId -  Id of the customer
# + isCsAdmin -  Whether the contact is a customer admin or not
# + isCsIntegrationUser -  Whether the contact is an Integration user or not (If true, the contact is not allowed to login to the SN portal)
# + customer - Customer account (Salesforce) related to the contact
# + account - Account (Salesforce) related to the contact  
# + owner - Allocated owner (account manager) details
# + certificationId - Contact certification Id  
# + certificationBannedDate - The contact is banned from date doing certifications  
# + lockoutStatus - represent customer lockout in support portal  
# + memberships - list of subscriptions memberships
# + relatedAccounts - list of related accounts
public type Contact record {|
    string? id = ();
    string? name = ();
    string? firstName = ();
    string? lastName= ();
    string? email = ();
    string? title = ();
    string? customerId = ();
    boolean? isCsAdmin = false;
    boolean? isCsIntegrationUser = false;
    Customer? customer = ();
    Account? account = ();
    AccountManager? owner = ();
    string? certificationId = ();
    string? certificationBannedDate = ();
    boolean? lockoutStatus = ();
    Membership[]? memberships = [];
    ContactRelatedAccount[]? relatedAccounts = [];
|};

# Represent a Support Account Member (customer)
#
# + id - Membership Id CRM  
# + subscriptionId - Customer Subscription Id
# + contact - Member Details (linked customer contact)  
# + status - Member Status 
public type Member record {
    string? id;
    string? subscriptionId;
    Contact? contact;
    string? status;
};

# represent a salesforce user
#
# + id - CRM id   
# + name - User full name  
# + email - User Emails
public type User record {
    string? id = ();
    string? name = ();
    string? email = ();
};

# represent a customer minimal 
#
# + name - Account full name  
# + legalName - Account legal name  
# + subRegion - Account sub region
public type CustomerMinimal record {
    string? name = ();
    string? legalName = ();
    string? subRegion = ();
};
# Sync execution details
#
# + syncType - Sync type 
# + startTime - Sync start time
# + endTime - Sync end time  
# + status - Sync status
public type SyncData record {
    string syncType;
    string? startTime;
    string? endTime;
    string status;
};

# [Entity] return meta data as string array
#
# + data - string array
public type Metadata record {
    string[] data;
};

# [Entity] return meta data as Owner object array
#
# + data - Owner object array
public type MetadataObj record {
    Owner[] data;
};

# Owner object with relevent details
#
# + name - name of owner  
# + email - email of owners
public type Owner record {
    string name;
    string email;
};

# [Entity] Lead
# 
# + id - ID (Salesforce)
# + email - Email
# + name - Full name
# + owner - Allocated owner (account manager) details
# + technicalOwnerEmail - Allocated PTO (Primary Technical Owner) email
# + questionComment - Posted questions/comments
public type Lead record {|
    string? id;
    string? email;
    string? name;
    AccountManager? owner;
    string? technicalOwnerEmail;
    string? questionComment;
|};

# [Entity] Account Manager
#
# + id - ID (Salesforce)
# + email - Email
# + name - Full name
public type AccountManager record {|
    string? id;
    string? email = "";
    string? name = "";
|};

# Represent use subscription memberships
#
# + id - Membership id  
# + subscriptionId - Subscription Id  
# + state - Membership states  
# + role - Membership Role  
# + 'type - membership type 
# + contactId - Contact Id  
# + email - Contact Email  
# + name - Contact Name
public type Membership record {|
    string? id;
    string? subscriptionId;
    MembershipState? state;
    string? role; 
    string? 'type;
    string? contactId;
    string? email;
    string? name;
|};


# Represent subscription membership with advance relation map
#
# + id - Membership id  
# + role - Membership role  
# + 'type - Membership type  
# + state - Membership states  
# + contact - Contact details  
# + subscription - Subscription details
public type MembershipAdvance record {|
    string? id;
    string? role; 
    string? 'type;
    MembershipState? state;
    ContactMinimal contact;
    Subscription? subscription;
|};

# ContactMinimal Details
#
# + id - ID (Salesforce)  
# + name - User Name  
# + email - email of the contact 
# + customerId - customer id 
public type ContactMinimal record {|
    string? id;
    string? name;
    string? email;
    string? customerId;
|};

# Contact related Account details
# 
# + id - ID (Salesforce)
# + roles - Account roles
public type ContactRelatedAccount record {|
    string? id;
    string? roles;
|};


# [Entity] Account
#
# + id - ID (Salesforce)
# + name - Account/Org name
# + website - Organization website
# + domainList - Allowed user domain list
# + classification - Account classification
# + isPartner - Whether the account is a Partner or not
public type Account record {|
    string? id;
    string? name;
    string? website = "";
    string? domainList = "";
    string? classification = "";
    boolean? isPartner;
|};

# [Entity] Certification
#
# + id - Certification object record Id (Salesforce)  
# + contactId - Contact object record Id (Salesforce)  
# + name - Certification type  
# + level - Certification Level (Developer, Practitioner, Expert, Solutions Architect, Professional)  
# + isAwarded - Certification Awarded or not  
# + awardedDate - Certification awarded date  
# + examDate - Exam date  
# + examState - Exam state (Fail, Passed, Registered)  
# + expirationDate - Expiration date of the certification  
# + bannedDate - Certification Banned date (if contact found any misconduct)  
# + origin - Origin of the certification registration (e.g. partner portal, wso2.com)  
# + badgeLink - Certification badge link
# + contact - Related Contact data  
# + exams - Certification Exam data
public type Certification record {|
    string id;
    string contactId;
    string? name;
    string? level;
    boolean? isAwarded;
    string? awardedDate;
    string? examDate;
    string? examState;
    string? expirationDate;
    string? bannedDate;
    string? origin;
    string? badgeLink;
    CertificationContact contact;
    CertificationExam[] exams = [];
|};

public type CertificationExam record {
    string? id?;
    string? name?;
    string? examId?;
    string? date?;
    string? state?;
    string? createdDate?;
    string? examDate?;
    string? expirationDate?;
    string? examVersion?;
    string? examType?;
    string? examVisibleType?;
    string? examPaperType?;
};

# [Entity] Contact within Certification entity
# 
# + id - Contact ID (Salesforce)
# + email - Email of the contact
# + firstName - First name of the contact
# + lastName - Last name of the contact
# + certificationId - Certification type
public type CertificationContact record {|
    string id;
    string email;
    string? firstName;
    string? lastName;
    string? certificationId;
|};


// ---- filter criteria ------

# [Query Filter] Customer
#
# + id - Customer account ID  
# + ids - List of IDs
# + company - Customer account/org name  
# + domain - Website domain  
# + startDate - Start date  
# + endDate - End date  
# + salesRegion - Sales Region  
# + salesRegions - Sales Regions
# + subRegion - Sub Region  
# + subRegions - Sub Regions
# + billingCountries - List of Billing Countries  
# + industries - List of Industries  
# + subIndustries - List of Sub Industries  
# + directChannelSales - Direct Channel Sales  
# + customerOwners - List of Account Owners  
# + customerStatuses - List of Account Statuses  
# + classifications - List of account classifications
# + excludeLostCustomer - Excluding lost customer
public type CustomersFilter record {
    string? id = ();
    string[]? ids = ();
    string? company = ();
    string? domain = ();
    string? startDate = ();
    string? endDate = ();
    string? salesRegion = ();
    string[]? salesRegions = ();
    string? subRegion = ();
    string[]? subRegions = ();
    string[]? billingCountries = ();
    string[]? industries = ();
    string[]? subIndustries = ();
    string? directChannelSales = ();
    string[]? customerOwners = ();
    string[]? customerStatuses = ();
    string[]? classifications = ();
    boolean? excludeLostCustomer = ();
};

# [Query Filter] Partner filter criteria
#  
# + customerId - Customer Id 
public type PartnerFilter record {
    string? customerId = ();
};

# [Query Filter] Subscription filter criteria
#
# + id - Subscription ID  
# + customerId - Customer Id 
# + key - Account Key  
# + name - Field Description
public type SubscriptionFilter record {
    string? id = ();
    string? customerId = ();
    string? key = ();
    string? name = ();
};

# [Query Filter] Subscription line item filter criteria
#
# + id - Subscription line item id
# + opportunityId - Opportunity id
# + classifications - List of classifications (PS, TAM etc)
public type SubscriptionLineItemFilter record {
    string? id = ();
    string? opportunityId = ();
    string[]? classifications = ();
};

# [Query Filter] use for filter invoices of  customers
#
# + id - Invoice Id  
# + customerId - Customer ID  
# + opportunityId - Opportunity Id
# + pendingInvoice - Invoice status (Uploaded/Not Uploaded)
public type InvoiceFilter record {
    string? id = ();
    string? customerId = ();
    string? opportunityId = ();
    boolean? pendingInvoice = false;
};

# [Query Filter] use to filter linked opportunities
#
# + id - Linked Opportunity Id  
public type LinkedOpportunityFilter record {
    string? id = ();
};

# [Query Filter] Opportunity
#
# + id - Opportunity Id 
# + customerId - Customer Id  
# + customerIds - List of Customer ID  
# + ids - List of Opportunity Ids  
# + stageName - Stage name of opportunity
# + confidence - Confidence level of opportunity
# + partnerRole - Partner role of opportunity
# + startDate - Start date  
# + endDate - End date  
# + exitDate - Opportunity exit Date  
# + salesRegion - Sales Region  
# + salesRegions - Sales Regions
# + subRegion - Sub Region  
# + subRegions - Sub Regions
# + billingCountries - List of Billing Countries  
# + industries - List of Industries  
# + subIndustries - List of Sub Industries   
# + directChannelSales - Direct Channel Sales  
# + entryVector - Entry Vector   
# + entryVectors - List of Entry Vectors  
# + accountOwners - List of Account Owners  
# + opportunityOwners - List of Opportunity Owners  
# + businessUnit - Business Unit  
# + isDelayed - Is Delayed
# + isOnlyActiveOpportunities - Is opportunities active
# + isCloudOpportunities - Include cloud opportunities
public type OpportunityFilter record {
    string? id = ();
    string? customerId = ();
    string[]? customerIds = ();
    string[]? ids = ();
    string? stageName = ();
    string? confidence = ();
    string? partnerRole = ();
    string? startDate = ();
    string? endDate = ();
    string? exitDate = ();
    string? salesRegion = ();
    string[]? salesRegions = ();
    string? subRegion = ();
    string[]? subRegions = ();
    string[]? billingCountries = ();
    string[]? industries = ();
    string[]? subIndustries = ();
    string? directChannelSales = ();
    string[]? entryVectors = ();
    string? entryVector = ();
    string[]? accountOwners = ();
    string[]? opportunityOwners = ();
    string? businessUnit = ();
    boolean? isDelayed = ();
    boolean? isOnlyActiveOpportunities = ();
    boolean? isCloudOpportunities = ();
};

# [Query Filter] Opportunity Active BANT filters
#
# + bantype - BANT type
# + wonType - Won type
# + region - Opportunity region
# + dateFrom - Filter start date
# + dateTo - Filter end date
# + businessUnit - Business Unit
public type ActiveBantFilter record {|
    BantType bantype;
    WonType wonType;
    Region region;
    string dateFrom;
    string dateTo;
    string? businessUnit;
|};

# [Query Filter] Opportunity Direct BANT filters
#
# + region - Opprotunity region
# + activationDateLiteral - Date the opportunity closed won (LAST_YEAR, THIS_YEAR, LAST_MONTH, THIS_MONTH)
# + dateFrom - Filter start date
# + dateTo - Filter end date
# + businessUnit - Business Unit
public type DirectBantFilter record {|
    Region region;
    string activationDateLiteral;
    string dateFrom;
    string dateTo;
    string? businessUnit;
|};

# [Query Filter] Opportunity Channel filters
#
# + region - Opportunity region
# + bantType - CHANNEL/DIRECT
# + psSupportStartDate - Opportunity support start date
# + psSupportEndDate - Opportunity support end date
# + dateTo - Opportunity date to period
# + businessUnit - Business Unit
public type ChannelFilter record {|
    Region region;
    BantType? bantType;
    string? psSupportStartDate;
    string? psSupportEndDate;
    string? dateTo;
    string? businessUnit;
|};

# [Query Filter] Lead object filters
#
# + id - Lead ID
# + ids - List of lead IDs
# + email - Lead email
public type LeadFilter record {|
    string? id = ();
    string[]? ids = ();
    string? email = ();
|};

# [Query Filter] Account manager entity filters
#
# + id - ID (Salesforce)
# + email - Email
public type AccountManagerFilter record {|
    string? id = ();
    string? email = ();
|};

# [Query Filter] SQL (Sales Qualified Lead) filters
#
# + businessUnit - Business Unit
# + region - Lead region
# + dateFrom - Filter start date
# + dateTo - Filter end date
public type SqlFilter record {|
    BusinessUnit? businessUnit;
    Region region;
    string dateFrom;
    string dateTo;
|};

# [Query Filter] Contact object filters
#
# + id - Contact ID
# + ids - List of contact IDs
# + email - Contact email
# + certificationId - Contact certification Id
# + certificationType - Certification type (I.e. WSO2 Certified API Manager Practitioner - V4 - API Management)
public type ContactFilter record {|
    string? id = ();
    string[]? ids = ();
    string? email = ();
    string? certificationId = ();
    string? certificationType = ();
|};

# [Query Filter] Membership object filters
#
# + id - Membership ID
# + projectId - Project ID
# + contactId - Membership ID
public type MembershipFilter record {|
    string? id = ();
    string? projectId = ();
    string? contactId = ();
|};

# [Query Filter] Certification object filters
#
# + id - Certification record ID (Salesforce record Id of the certification)
# + certificationType - Certification type (I.e. WSO2 Certified API Manager Practitioner - V4 - API Management)
# + certificationId - Contact's certification Id
# + organizationId - Contact's certification Id
# + contactEmail - Contact's email
public type CertificationFilter record {|
    string? id = ();
    string? certificationType = ();
    string? certificationId = ();
    string? organizationId = ();
    string? contactEmail = ();
|};

# [Query Filter] exam object filters
#
# + id - Exam record ID (Salesforce record Id of the certification)
# + examVersion - Exam version 
# + state - Exam's state
# + contactId - Contact Id
public type ExamFilter record {|
    string? id = ();
    string? examVersion = ();
    string? state = ();
    string? contactId = ();
|};

// ------ GraphQL Mutation Input Records ------
# [Mutation Input] Lead allocation update input.
# 
# + leadId - Lead ID (Salesforce)
# + ownerEmail - Owner (account manager) email
# + techOwnerEmail - PTO (Primary Technical Owner) email
public type LeadAllocationInput record {|
    string leadId;
    string ownerEmail;
    string? techOwnerEmail;
|};

# Add New Contact Payload
#
# + email - Contact Email Address
# + firstName - FirstName of the Contact
# + lastName - Last Name of the Contact
# + accountId - Account Id
# + isCsIntegrationUser - Whether the contact is an Integration user or not (If true, the contact is not allowed to login to the SN portal)
public type CreateContactInput record {|
    string email;
    string firstName;
    string lastName;
    string accountId;
    boolean isCsIntegrationUser;
|};

# Create Membership Payload
#
# + contactId - Contact Id
# + projectId - Project Id
# + contactType - Type of the Contact (Own Contact / Partner Contact)
public type CreateMembershipInput record {|
    string contactId;
    string projectId;
    string contactType;
|};

public enum ContactType {
    OWN_CONTACT = "OWN CONTACT",
    PARTNER_CONTACT = "PARTNER CONTACT"
};

# [Mutation Input] Create certification object input
# 
# + examType - Exam type which the contact needs to be registered
# + certificationId - Certification Id of the contact
# + origin - Origin of the certification registration (e.g. partner portal, wso2.com)
public type CreateCertificationInput record {
    string examType;
    string certificationId;
    string origin;
};


# Pagination Parameters
#
# + page - page number [>0]  
# + pageSize - page size (records per page ie : 100)
public type Pagination record {|
    int page;
    int pageSize;
|};

# Date period filters
#
# + startDate - Start date of the period "2020-12-31"  
# + endDate - End date of the period "2021-01-31"
public type DatePeriodFilter record {
    string startDate;
    string endDate;
};

// ---- enums ------

public enum BantType {
    DIRECT,
    CHANNEL
}

public enum WonType {
    CLOSED,
    OPEN
}

public enum Region {
    GLOBAL,
    NA,
    APAC,
    MEA,
    ANZ,
    LATAM,
    EU1,
    EU2,
    EU3
}

# Business Units
public enum BusinessUnit {
    Integration,
    IAM
}

# Validation filter types
# 
# Word - Contains only alphabetical characters  
# Date - Contains RFC 3339 format date  
# SF ID - Contains Salesforce ID  
public enum ValidationType {
    WORD,
    DATE,
    EMAIL,
    SF_ID
}

public enum MembershipState {
    INVITED,
    REGISTERED, 
    DEACTIVATED, 
    REINVITED
}