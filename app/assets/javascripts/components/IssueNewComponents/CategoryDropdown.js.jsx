var CategoryDropdown = React.createClass({
  render: function(){

  var categories = this.props.categories.map(function(category,index){
   /* return <input ref="category" type="checkbox" name={"issue[category" + index + "]"}  value={category.id}> {category.name} <br/></input> */
    return <input ref="category" type="checkbox" name={"categories[category" + index + "]"}  value={category.id}> {category.name} <br/></input>
  });

    return (
   <div className="category_dropdown">
      {categories}
   </div>
      )
  }
})


