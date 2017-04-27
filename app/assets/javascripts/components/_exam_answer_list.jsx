var ExamAnswerList = React.createClass({
	render(){
		var answerId=`examAnswer${this.props.answer.id}`
		return(
			<li key={this.props.answer.id}>
      	<input type="radio" ref="answer" name="answer" id={answerId} className="answer" />
      	<label htmlFor={answerId}>{this.props.answer.content}</label>
			</li>
		)
	}
})