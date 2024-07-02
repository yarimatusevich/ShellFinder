import Foundation
import GoogleAPIClientForREST

class GoogleSheetService {
    
    private let spreadsheetID = "1XB4LqeGk9nEvwhgfSNQ8kIxJSKfgVwjmJswtfkFaQLU"
    private let spreadsheetRange = "Shell Database" // range is entire sheet titled shell database
    
    public static func fetchData(spreadSheetID: String, range: String) {
        let query = GTLRSheetsQuery_SpreadsheetsValuesGet.query(withSpreadsheetId: spreadSheetID, range: range)
    }
}
