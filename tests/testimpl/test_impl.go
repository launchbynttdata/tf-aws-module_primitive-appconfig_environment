package testimpl

import (
	"context"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/appconfig"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// TestComposableComplete verifies the deployed AppConfig environment.
func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	verifyEnvironment(t, ctx)
}

// TestComposableCompleteReadOnly verifies the deployed AppConfig environment using read-only AWS API calls.
func TestComposableCompleteReadOnly(t *testing.T, ctx types.TestContext) {
	verifyEnvironment(t, ctx)
}

func verifyEnvironment(t *testing.T, ctx types.TestContext) {
	opts := ctx.TerratestTerraformOptions()
	region := terraform.Output(t, opts, "region")
	applicationID := terraform.Output(t, opts, "application_id")
	id := terraform.Output(t, opts, "id")
	name := terraform.Output(t, opts, "name")
	state := terraform.Output(t, opts, "state")

	require.NotEqual(t, "", id)
	assert.Equal(t, terraform.Output(t, opts, "expected_name"), name)

	client := appConfigClient(t, region)
	environment, err := client.GetEnvironment(context.Background(), &appconfig.GetEnvironmentInput{
		ApplicationId: aws.String(applicationID),
		EnvironmentId: aws.String(id),
	})
	require.NoError(t, err)

	assert.Equal(t, applicationID, aws.ToString(environment.ApplicationId))
	assert.Equal(t, id, aws.ToString(environment.Id))
	assert.Equal(t, name, aws.ToString(environment.Name))
	assert.Equal(t, state, string(environment.State))
}

func appConfigClient(t *testing.T, region string) *appconfig.Client {
	t.Helper()

	cfg, err := config.LoadDefaultConfig(context.Background(), config.WithRegion(region))
	require.NoError(t, err)

	return appconfig.NewFromConfig(cfg)
}
