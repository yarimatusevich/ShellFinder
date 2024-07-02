import Foundation
import GoogleAPIClientForREST

class GoogleService {
    
    private let spreadSheetID = "1XB4LqeGk9nEvwhgfSNQ8kIxJSKfgVwjmJswtfkFaQLU"
    private let range = "Shell Database" // range is entire sheet titled shell database
    
    public static func fetchData() {
        GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}
    }
}
