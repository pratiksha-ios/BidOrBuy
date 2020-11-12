/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Trade : Codable {
	let images : [Images]?
	let amount : Float?
	let mobicredInstalment : String?
	let title : String?
	let type : String?
	let userId : Int?
	let hotSelling : Bool?
	let discountPercentage : Int?
	let ancestorCategoryList : [AncestorCategoryList]?
	let recommendedRetailPrice : Float?
	let categoryBreadCrumb : String?
	let userAlias : String?
	let closeTime : String?
	let homeCategoryId : Int?
	let location : String?
	let openTime : String?
	let tradeId : Int?
	let status : String?

	enum CodingKeys: String, CodingKey {

		case images = "images"
		case amount = "amount"
		case mobicredInstalment = "mobicredInstalment"
		case title = "title"
		case type = "type"
		case userId = "userId"
		case hotSelling = "hotSelling"
		case discountPercentage = "discountPercentage"
		case ancestorCategoryList = "ancestorCategoryList"
		case recommendedRetailPrice = "recommendedRetailPrice"
		case categoryBreadCrumb = "categoryBreadCrumb"
		case userAlias = "userAlias"
		case closeTime = "closeTime"
		case homeCategoryId = "homeCategoryId"
		case location = "location"
		case openTime = "openTime"
		case tradeId = "tradeId"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		images = try values.decodeIfPresent([Images].self, forKey: .images)
		amount = try values.decodeIfPresent(Float.self, forKey: .amount)
		mobicredInstalment = try values.decodeIfPresent(String.self, forKey: .mobicredInstalment)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		hotSelling = try values.decodeIfPresent(Bool.self, forKey: .hotSelling)
		discountPercentage = try values.decodeIfPresent(Int.self, forKey: .discountPercentage)
		ancestorCategoryList = try values.decodeIfPresent([AncestorCategoryList].self, forKey: .ancestorCategoryList)
		recommendedRetailPrice = try values.decodeIfPresent(Float.self, forKey: .recommendedRetailPrice)
		categoryBreadCrumb = try values.decodeIfPresent(String.self, forKey: .categoryBreadCrumb)
		userAlias = try values.decodeIfPresent(String.self, forKey: .userAlias)
		closeTime = try values.decodeIfPresent(String.self, forKey: .closeTime)
		homeCategoryId = try values.decodeIfPresent(Int.self, forKey: .homeCategoryId)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		openTime = try values.decodeIfPresent(String.self, forKey: .openTime)
		tradeId = try values.decodeIfPresent(Int.self, forKey: .tradeId)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
