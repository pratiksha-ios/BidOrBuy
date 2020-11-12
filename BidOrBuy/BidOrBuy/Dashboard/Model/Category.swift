/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Category : Codable {
	let tradeCount : Int?
	let buyNowCount : Int?
	let name : String?
	let auctionCount : Int?
	let classifiedCount : Int?
	let leaf : Bool?
	let categoryId : Int?

	enum CodingKeys: String, CodingKey {

		case tradeCount = "tradeCount"
		case buyNowCount = "buyNowCount"
		case name = "name"
		case auctionCount = "auctionCount"
		case classifiedCount = "classifiedCount"
		case leaf = "leaf"
		case categoryId = "categoryId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		tradeCount = try values.decodeIfPresent(Int.self, forKey: .tradeCount)
		buyNowCount = try values.decodeIfPresent(Int.self, forKey: .buyNowCount)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		auctionCount = try values.decodeIfPresent(Int.self, forKey: .auctionCount)
		classifiedCount = try values.decodeIfPresent(Int.self, forKey: .classifiedCount)
		leaf = try values.decodeIfPresent(Bool.self, forKey: .leaf)
		categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
	}

}