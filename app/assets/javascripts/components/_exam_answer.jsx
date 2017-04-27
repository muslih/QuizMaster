var ExamAnswer = React.createClass({

	render(){
		var answers = this.props.answers.map((answer) => {
			return(
				<ExamAnswerList answer={answer} />
			)
		});

		return(
			<ol>
				{answers}
			</ol>
		)
	}
})