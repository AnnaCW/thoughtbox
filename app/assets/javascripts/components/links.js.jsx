class Links extends React.Component {
  constructor(props) {
    super();
    this.state = {
      links: props.links
    }
  }

  handleUpdate(newStatus, linkId, data) {
    var links = this.state.links
    $.ajax({
        url: "/api/v1/links/" + linkId + ".json",
        method: "PATCH",
        data: data,
          success:(link) => {
            var updated = links.filter( (ls) => { return ls.id != link.id });
            updated.push(link);
            this.setState( {links: updated });

            console.log(links)
          },
       });
  }


  render() {
    var links = this.state.links.map( (link) => {
      return <Link key={link.id} handleUpdate={this.handleUpdate.bind(this)} link={link} />
    })
    return(
      <div>{links}</div>
    );
  }
}
