Hướng dẫn Xây dựng Recommender System Dùng Machine Learning\.

1. Giới thiệu về Recommender System

Là 1 tập hợp những thông tin con của hệ thống, những thông tin con này được dung để tiên đoán được sở thích, rating của user trên những sản phẩm. Recommender System đã trở nên rất phổ biến trong những năm gần đây, và được sử dụng trong một loạt các lĩnh vực: một số ứng dụng phổ biến bao gồm phim ảnh, âm nhạc, tin tức, sách, các bài báo nghiên cứu, các truy vấn tìm kiếm, thẻ xã hội, nhà hàng, dịch vụ tài chính, bảo hiểm nhân thọ, hẹn hò trực tuyến.

1. Một Vài loại recommender system
a. Content-based filtering.
Là những phương pháp dựa trên mô tả của những item và user profile mà sẽ thích item đó. Hầu hết các hệ thống thường 	dùng những keyword để mô tả item và User’s Profile. Ví dụ chúng ta có những nhà tuyển dụng họ post những jobs về “Ruby On Rails” và với những jobs nhưng vậy chúng ta sẽ cần tìm những User Profile mà sẽ thích “Ruby On Rails job”.  Bởi vì dùng những keywrod để description cho những item và user’s profile cho nên giải thuật tf-idf và KNN thường được áp dụng. Giả sử tôi có 64 jobs bao gồm nhiều type of jobs java, 3 ruby vvv. Với một Ruby On rails profile làm sao tôi có thể recommend jobs ruby cho 1 ruby developer. Chúng ta sẽ thử áp dụng tf-idf trên jobs document để tìm những vector keywords cho từng documents, loại bỏ những common words và phân cụm dựa trên keywords. Có thể cụm thứ 1 gồm java, c++, cụm thứ 2: Ruby, c++ … Làm tương tự cho user’s profile. Sau đó dùng cosine distance tính khoảng cách của users và jobs, hoặc là khoảng cách giữa user và user. Bởi vì nếu 2 users có the same profile chúng ta có thể dựa vào history interaction để recommend những job cho users. Ví dụ job đó được apply bởi user có java skill, location là hcm, ….. Thì user có the same profile có khả năng sẽ apply for this job.

Job Description

Tem Frequency:

A

Ruby

…

Rails

…\.

The

………\.\.

1000

12

12

1000

		Inverse Document Frequency

		

A

Ruby

…

Rails

…\.

The

………\.\.

log\(64/\(1 \+ 63\)\)=0 

Log\(64/\(1 \+ 3\)\) = Log\(18\)

log\(64/\(1 \+ 3\)\) = Log\(18\)

log\(64/\(1 \+ 63\)\)=0

		

		TF\-IDF

A

Ruby

…

Rails

…

The

………\.\.

0

12 \* Log\(18\)

12 \* Log\(18\)

0

		Chúng ta sẽ thấy trong 64 docs đều có từ “the, a” những từ này là common words 

		Cho nên tf\-idf = 0\.

		References:

		[https://en\.wikipedia\.org/wiki/K\-means\_clustering](https://en.wikipedia.org/wiki/K-means_clustering)

		[https://en\.wikipedia\.org/wiki/K\-nearest\_neighbors\_algorithm](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm)

		Tools for a content\-based filtering:

Để tránh mất thời gian chúng ta thường dùng search tools dưới đây để implement content\-based filter\.

[Apache Lucene](http://lucene.apache.org/) is an open\-source Java search package that is widely used and has good out\-of\-the\-box search performance\.

Apache Solr is built on top of Lucene and provides an HTTP\-based API for access from any programming language, scalability features, and much more\. It takes Lucene's algorithms and makes them much easier to use\.

[ElasticSearch ](https://www.elastic.co/products/elasticsearch)is another search server that provides an HTTP API, like Solr\. Most search packages can be repurposed into content\-based recommenders\.

[lunr\.js](http://lunrjs.com/) implements basic search & content\-based filtering algorithms in JavaScript, and can be used client\-side in the browser\.

[Xapian ](http://xapian.org/)is a GPL\-licensed C\+\+ search engine\.

		

- 
	1. User\-User Collabotive filtering

Là một hệ thống mà users được xem xét 

- 
	1. Item\-Item collabotive filtering

Amazon là một trang web online shopping nổi tiếng đã sáng tạo ra phương pháp này\. Họ đưa ra công thức tính toán dựa trên những đặc điểm tương đồng hay hỗ trợ của sản phẩm sau khi người dùng rating hoặc là lịch sử puchased\.

Chúng ta sẽ xét 2 loại sản phẩm Iphone7, Iphone7 Case Trainium\. Có nhiều người khi mua mua Iphone7 sẽ mua 1 iphone 7 case và ngược lại\. Cho nên chúng ta sẽ tạo ra một Co\-Occurrence Matrix để recommend những products to user\.  Do những người mua iphone 7 case sẽ mua iphone 7 cho nên Matrix là symmetric\. Đầu tiên tôi sẽ nhìn vào iphone 7 row và tìm những user đã mua iphone 7 sau đó quyết định proposal cho họ iphone 7 case\.

Iphone 7 \(user\_id\)

Iphone 7 \(user\_id\)

?

?

?

?

Iphone 7 Case

Iphone 7 Case

1. Hướng dẫn Build 1 simple user\-user recommender system dùng Movielens data\.
	1. Database modeling for Movie\-Review app: Chúng ta thấy trong mô hình này một phim có nhiều genres và 1 users có thể reviews trên nhiều phim\. 

Hinh 

- 
	1. Phân cụm những movies theo theo genres:

Đối với movilens chúng ta sẽ có 19 genres đó là lý do về mặt trực quan chúng ta chia thành 19 cụm\. Nhưng thật sự nếu chúng ta chia bao nhiêu cụm đi chăng nữa phương pháp này cho ra kết quả tương tự\. Có thể cụm thứ nhất bao gồm những bộ phim lãng mạng, hài hước và cụm thứ 2 bao gồm những bộ phim về action, advanture v\.v\.v\.  

 

clusters = Kmeans\(19, all\_genres\_value\)

- 
	1. Calculate rating cho từng user trên những bộ phim theo group\.

Xét trên tất cả những bộ phim mà user đã review\. Nếu user đã review cho những tập phim thuộc group thứ nhất vơi rating 3, 4, 2, 1 và group thứ 2 với rating 5, 4, 3,  2, 5,  1\.

\[\(1 \+ 2 \+ 3 \+ 4\)/4, \(5 \+ 4 \+ 3 \+ 2 \+ 5 \+ 1\)/6, …\.\.\]

- 
	1. Sau khi có được vector rating của user trên tất cả cả tập phim theo group\. Lúc này chúng ta có thể dễ dàng tính được khoảng cách giữa nhưng users dựa trên những tập phim mà họ đã xem dùng cosine distance\. Sau đó recommend cho user hiện tại với những phim mà những user khác trong qúa khứ đã xem\.

App demo: https://github\.com/quangvinh0513/movie\_recommender\_app1

 

 

