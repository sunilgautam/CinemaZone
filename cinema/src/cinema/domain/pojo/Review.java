package cinema.domain.pojo;

public class Review
{
    private String reviewId;
    private String movieId;
    private String movieName;
    private String review;
    private String reviewBy;
    private String stars;
    private String starsClass;

    public Review()
    {

    }

    public Review(String reviewId, String movieId, String movieName, String review, String reviewBy, String stars)
    {
	this.reviewId = reviewId;
	this.movieId = movieId;
	this.movieName = movieName;
	this.review = review;
	this.reviewBy = reviewBy;
	this.stars = stars;
    }

    public String getReviewId()
    {
	return reviewId;
    }

    public void setReviewId(String reviewId)
    {
	this.reviewId = reviewId;
    }

    public String getMovieId()
    {
	return movieId;
    }

    public void setMovieId(String movieId)
    {
	this.movieId = movieId;
    }

    public String getMovieName()
    {
	return movieName;
    }

    public void setMovieName(String movieName)
    {
	this.movieName = movieName;
    }

    public String getReview()
    {
	return review;
    }

    public void setReview(String review)
    {
	this.review = review;
    }

    public String getReviewBy()
    {
	return reviewBy;
    }

    public void setReviewBy(String reviewBy)
    {
	this.reviewBy = reviewBy;
    }

    public String getStars()
    {
	return stars;
    }

    public void setStars(String stars)
    {
	this.stars = stars;
    }

    public String getStarsClass()
    {
	if (this.stars.equals("0.50"))
	{
	    return "half";
	}
	else if (this.stars.equals("1.00"))
	{
	    return "one";
	}
	else if (this.stars.equals("1.50"))
	{
	    return "one-half";
	}
	else if (this.stars.equals("2.00"))
	{
	    return "two";
	}
	else if (this.stars.equals("2.50"))
	{
	    return "two-half";
	}
	else if (this.stars.equals("3.00"))
	{
	    return "three";
	}
	else if (this.stars.equals("3.50"))
	{
	    return "three-half";
	}
	else if (this.stars.equals("4.00"))
	{
	    return "four";
	}
	else if (this.stars.equals("4.50"))
	{
	    return "four-half";
	}
	else if (this.stars.equals("5.00"))
	{
	    return "five";
	}
	return this.stars;
    }

    public void setStarsClass(String starsClass)
    {
	this.starsClass = starsClass;
    }
}
