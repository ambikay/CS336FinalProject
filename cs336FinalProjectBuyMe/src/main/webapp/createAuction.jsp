
<t:base context="${pageContext.request.contextPath}" title="Create Auction">


<button onclick="window.location.href='userfirstpage.jsp';">Return to Homepage</button>

  <h3> Auction Page</h3>
	<div class="content">
		<form action="Auctionverify.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="hidden" name="product_id" value = <%=request.getParameter("product_id")%>>
	</td>
	</tr> 
	<tr>    
	<td>End Date: <br><p>Enter the end date of the auction in the specified format (yyyy-MM-dd hh:mm:ss)</p> </td><td><input type="text" name="end_datetime" id="end_datetime" placeholder="yyyy-MM-dd hh:mm:ss" required></td>
	</tr> 
	<tr>   
	<td>Secret Minimum Price: <br><p>Enter the minimum price that you want to sell this item for</p><br> <p>Note: Minimum Price has to be greater than 0 and will be hidden from other users </p> </td><td><input type="number" name="min_price" placeholder="0" required></td>
	</tr>	
	<tr>    
	<td>Initial Price: <br><br> <p> Note: Initial Price has to be lesser than the secret minimum price </p> </td><td><input type="number" name="starting_price" placeholder="0" required></td>
	</tr>	
	<tr>    
	<td>New Bid Increment: <br><p>Enter the Bid Increment for the next valid bid</p> </td><td><input type="number" name="new_bid_increment" placeholder="0" required></td>
	</tr>	
	
	</table>
	<input type="submit" value="Create Auction">
	</form>
	</div>
	
</t:base>