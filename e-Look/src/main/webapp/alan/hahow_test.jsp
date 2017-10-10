<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="search-bar-container">
	<sh-search-bar search-condition-updated-callback="courseListCtrl.onSearchConditionUpdated(searchCondition)" 
	ui-state="home.coureseList" class="ng-isolate-scope">
	<div class="sh-search-bar clearfix">
		<div class="search-form clearfix">
			<ul class="category-list large-screen" ng-class="{ 'selected-mode' : shSearchBarCtrl.searchCondition.selectedCategory._id }">
			<!-- ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/life.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/life.png">
						<div class="title ng-scope" translate="CATEGORY.LIFE">生活
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/art.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/art.png">
						<div class="title ng-scope" translate="CATEGORY.ART">藝術
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/sport.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/sport.png">
						<div class="title ng-scope" translate="CATEGORY.SPORT">運動
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/media.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/media.png">
						<div class="title ng-scope" translate="CATEGORY.MEDIA">影音
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/craft.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/craft.png">
						<div class="title ng-scope" translate="CATEGORY.CRAFT">手作
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/other.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/other.png">
						<div class="title ng-scope" translate="CATEGORY.OTHERS">其他
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/design.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/design.png">
						<div class="title ng-scope" translate="CATEGORY.DESIGN">設計
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/technology.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/technology.png">
						<div class="title ng-scope" translate="CATEGORY.TECHNOLOGY">科技
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/business.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/business.png">
						<div class="title ng-scope" translate="CATEGORY.BUSINESS">商業
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/language.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/language.png">
						<div class="title ng-scope" translate="CATEGORY.LANGUAGE">語言
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/cooking.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/cooking.png">
						<div class="title ng-scope" translate="CATEGORY.COOKING">烹飪
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/coding.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/coding.png">
						<div class="title ng-scope" translate="CATEGORY.CODING">程式
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
			</ul>
			
			<label class="txt-bold queyr-string-container marg-l-15 marg-t-30" 
			ng-class="{ 'disabled' : shSearchBarCtrl.searchCondition.selectedCategory._id }">
			<!-- ngIf: shSearchBarCtrl.searchCondition.selectedCategory._id -->
			<ul class="category-list small-screen dropdown-menu pad-b-15" 
			ng-class="{ 'selected-mode' : shSearchBarCtrl.searchCondition.selectedCategory._id }">
			<!-- ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/life.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/life.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.LIFE">生活
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/art.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/art.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.ART">藝術
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/sport.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/sport.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.SPORT">運動
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/media.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/media.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.MEDIA">影音
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/craft.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/craft.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.CRAFT">手作
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/other.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/other.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.OTHERS">其他
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/design.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/design.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.DESIGN">設計
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/technology.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/technology.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.TECHNOLOGY">科技
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/business.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/business.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.BUSINESS">商業
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/language.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/language.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.LANGUAGE">語言
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/cooking.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/cooking.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.COOKING">烹飪
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
				<li ng-repeat="categoryItem in shSearchBarCtrl.categoryList" class="ng-scope">
					<div class="clearfix pad-t-15 pad-rl-10" ng-click="shSearchBarCtrl.selectCategory(categoryItem)">
						<img class="category-img-sm" ng-src="https://hahow.in/assets/images/category/coding.png" 
						ng-class="{ 'active' : shSearchBarCtrl.searchCondition.selectedCategory._id === categoryItem._id }" 
						src="https://hahow.in/assets/images/category/coding.png">
						<div class="title pad-b-15 ng-scope" translate="CATEGORY.CODING">程式
						</div>
					</div>
				</li><!-- end ngRepeat: categoryItem in shSearchBarCtrl.categoryList -->
			</ul>
			<span class="btn-category dropdown-toggle no-animate" type="button" id="dropdown-menu-category" 
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i	 class="fa fa-tags"></i>
			</span>
			<span for="search-subject" class="btn-search" 
				ng-class="{ 'disabled' : shSearchBarCtrl.searchCondition.selectedCategory._id }">
				<i class="fa fa-search"></i>
			</span>
			
			<input placeholder="搜尋" type="text" ng-model="shSearchBarCtrl.searchCondition.queryString" 
				id="search-subject" ng-keyup="$event.keyCode===13?shSearchBarCtrl.onSearchQueryEntered():null;
				 shSearchBarCtrl.searchCondition.queryString.length===0?shSearchBarCtrl.onSearchQueryCleared():null;" 
				 ng-class="{ 'disabled' : shSearchBarCtrl.searchCondition.selectedCategory._id }" 
				 class="ng-pristine ng-untouched ng-valid"> 
				 <!-- ngIf: shSearchBarCtrl.searchCondition.queryString.length > 0 -->
		 </label>
		 <div class="dropdown-menu-container pull-right marg-t-30">
		 <!-- ngIf: shSearchBarCtrl.filterTypeList.length > 0 -->
		 <!-- ngIf: shSearchBarCtrl.sortKeyList.length > 0 -->
		 </div>
	 </div>
 </div></sh-search-bar>
</div>
</body>
</html>