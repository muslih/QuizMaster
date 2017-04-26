var NavTop = React.createClass({
	render(){
		return(
			<div id="navtop">
	      <div className="container">
	        <div className="col-sm-12">           
	          Implementation of Quipper&#39;s coding test.
	          <div className="pull-right">
	          	Welcome <strong>{this.props.username} </strong> | <a href={this.props.signout} data-method="delete"> Signout </a>
	          </div>       
	        </div>
	     </div>   
	  	</div>
		)
	}
})