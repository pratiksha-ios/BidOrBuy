/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Bidorbuy : Codable {
	let hasMandatoryAttributes : Bool?
	let hasAttributes : Bool?
	let name : String?
	let fullname : String?
	let totalTradeCount : Int?
	let isLeaf : Bool?
	let categoryId : Int?
	let parentId : Int?
	let secondaryTradesCount : Int?

	enum CodingKeys: String, CodingKey {

		case hasMandatoryAttributes = "hasMandatoryAttributes"
		case hasAttributes = "hasAttributes"
		case name = "name"
		case fullname = "fullname"
		case totalTradeCount = "totalTradeCount"
		case isLeaf = "isLeaf"
		case categoryId = "categoryId"
		case parentId = "parentId"
		case secondaryTradesCount = "secondaryTradesCount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hasMandatoryAttributes = try values.decodeIfPresent(Bool.self, forKey: .hasMandatoryAttributes)
		hasAttributes = try values.decodeIfPresent(Bool.self, forKey: .hasAttributes)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		fullname = try values.decodeIfPresent(String.self, forKey: .fullname)
		totalTradeCount = try values.decodeIfPresent(Int.self, forKey: .totalTradeCount)
		isLeaf = try values.decodeIfPresent(Bool.self, forKey: .isLeaf)
		categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
		parentId = try values.decodeIfPresent(Int.self, forKey: .parentId)
		secondaryTradesCount = try values.decodeIfPresent(Int.self, forKey: .secondaryTradesCount)
	}

}